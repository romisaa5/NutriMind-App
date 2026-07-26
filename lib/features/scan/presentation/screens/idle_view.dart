import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/scan/presentation/widgets/round_icon_button.dart';
import 'package:nutri_mind/generated/l10n.dart';

class IdleView extends StatelessWidget {
  final VoidCallback onScan;
  const IdleView({super.key, required this.onScan});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomIn(
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 260.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: context.customAppColors.primary100.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(
                  color: context.customAppColors.primary200,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_camera_outlined,
                    size: 64.sp,
                    color: context.customAppColors.primary500,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    s.scanIdleHint,
                    style: AppTextStyles.font14SemiBold.copyWith(
                      color: context.customAppColors.primary800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 36.h),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              s.scanIdleDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.font14Regular.copyWith(
                color: context.customAppColors.neutral700,
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: Icons.image_outlined,
                  onTap: onScan,
                  background: context.customAppColors.neutral100,
                  iconColor: context.customAppColors.neutral700,
                ),
                SizedBox(width: 20.w),
                Pulse(
                  infinite: true,
                  duration: const Duration(seconds: 2),
                  child: RoundIconButton(
                    icon: Icons.camera_alt_rounded,
                    onTap: onScan,
                    background: context.customAppColors.primary500,
                    iconColor: context.customAppColors.white,
                    size: 72,
                  ),
                ),
                SizedBox(width: 20.w),
                RoundIconButton(
                  icon: Icons.flash_on_rounded,
                  onTap: () {},
                  background: context.customAppColors.neutral100,
                  iconColor: context.customAppColors.neutral700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
