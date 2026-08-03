import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/language_segmented_control.dart';
import 'package:nutri_mind/generated/l10n.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: context.customAppColors.primary100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.language_rounded,
                  color: context.customAppColors.primary700,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.profileLanguageTitle,
                      style: AppTextStyles.font14Bold.copyWith(
                        color: context.customAppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      s.profileLanguageSubtitle,
                      style: AppTextStyles.font12Regular.copyWith(
                        color: context.customAppColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const LanguageSegmentedControl(),
        ],
      ),
    );
  }
}
