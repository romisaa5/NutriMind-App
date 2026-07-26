import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/generated/l10n.dart';
import '../../../../core/utils/common_imports.dart';

class ScanningView extends StatelessWidget {
  final AnimationController lineController;
  final AnimationController pulseController;
  const ScanningView({
    super.key,
    required this.lineController,
    required this.pulseController,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 260.w,
                height: 300.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: context.customAppColors.neutral100.withValues(
                    alpha: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: Icon(
                  Icons.restaurant_rounded,
                  size: 90.sp,
                  color: context.customAppColors.neutral400.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: lineController,
                builder: (context, _) {
                  return Positioned(
                    top: 10 + (lineController.value * 280),
                    child: Container(
                      width: 240.w,
                      height: 3.h,
                      decoration: BoxDecoration(
                        color: context.customAppColors.primary500,
                        borderRadius: BorderRadius.circular(4.r),
                        boxShadow: [
                          BoxShadow(
                            color: context.customAppColors.primary500
                                .withValues(alpha: 0.6),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 14.h,
                child: FadeIn(
                  child: AnimatedBuilder(
                    animation: pulseController,
                    builder: (context, child) {
                      final scale = 1 + (pulseController.value * 0.06);
                      return Transform.scale(scale: scale, child: child);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.customAppColors.primary700,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: context.customAppColors.primary700
                                .withValues(alpha: 0.4),
                            blurRadius: 12,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            size: 14.sp,
                            color: context.customAppColors.white,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            s.scanAiBadge,
                            style: AppTextStyles.font12SemiBold.copyWith(
                              color: context.customAppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          FadeIn(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.customAppColors.primary500,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  s.scanAnalyzingTitle,
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: context.customAppColors.neutral900,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            s.scanAnalyzingSubtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.font13Regular.copyWith(
              color: context.customAppColors.neutral700,
            ),
          ),
        ],
      ),
    );
  }
}
