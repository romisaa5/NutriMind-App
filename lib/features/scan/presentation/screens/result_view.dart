import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/scan/presentation/widgets/nutrient_pill.dart';
import 'package:nutri_mind/generated/l10n.dart';

class ResultView extends StatelessWidget {
  final VoidCallback onReset;
  const ResultView({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    const calories = 480;
    const protein = 28;
    const carbs = 52;
    const fat = 16;

    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
      children: [
        FadeInDown(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              height: 200.h,
              width: double.infinity,
              color: context.customAppColors.neutral100.withValues(alpha: 0.5),
              child: Icon(
                Icons.set_meal_rounded,
                size: 70.sp,
                color: context.customAppColors.neutral500,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        FadeInUp(
          delay: const Duration(milliseconds: 100),
          child: Text(
            s.scanResultMealName,
            style: AppTextStyles.font18Bold.copyWith(
              color: context.customAppColors.neutral900,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        FadeInUp(
          delay: const Duration(milliseconds: 150),
          child: Text(
            s.scanResultEstimateNote,
            style: AppTextStyles.font12Regular.copyWith(
              color: context.customAppColors.neutral700,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: SoftCard(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      s.scanCaloriesLabel,
                      style: AppTextStyles.font14SemiBold.copyWith(
                        color: context.customAppColors.neutral800,
                      ),
                    ),
                    Text(
                      s.scanCaloriesValue(calories),
                      style: AppTextStyles.font18Bold.copyWith(
                        color: context.customAppColors.primary700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Expanded(
                      child: NutrientPill(
                        label: s.scanProteinLabel,
                        value: protein,
                        color: context.customAppColors.info700,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: NutrientPill(
                        label: s.scanCarbsLabel,
                        value: carbs,
                        color: context.customAppColors.warning500,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: NutrientPill(
                        label: s.scanFatLabel,
                        value: fat,
                        color: context.customAppColors.accent700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 28.h),
        FadeInUp(
          delay: const Duration(milliseconds: 300),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onReset,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    side: BorderSide(color: context.customAppColors.grey300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    s.scanRetryButton,
                    style: AppTextStyles.font14SemiBold.copyWith(
                      color: context.customAppColors.neutral700,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.customAppColors.primary500,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    s.scanSaveButton,
                    style: AppTextStyles.font14Bold.copyWith(
                      color: context.customAppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
