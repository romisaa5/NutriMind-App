import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/helpers/enums.dart';
import 'package:nutri_mind/core/helpers/extensions.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/features/scan/data/models/meal_analysis_result.dart';
import 'package:nutri_mind/features/scan/presentation/widgets/nutrient_pill.dart';
import 'package:nutri_mind/generated/l10n.dart';

class ResultView extends StatelessWidget {
  final MealAnalysisResult analysis;
  final MealType mealType;
  final Uint8List imageBytes;
  final bool isSaving;
  final VoidCallback onReset;
  final VoidCallback onSave;

  const ResultView({
    super.key,
    required this.analysis,
    required this.mealType,
    required this.imageBytes,
    required this.isSaving,
    required this.onReset,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
      children: [
        FadeInDown(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.memory(
              imageBytes,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        FadeInUp(
          delay: const Duration(milliseconds: 80),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: context.customAppColors.primary100,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  mealType.icon,
                  size: 14.sp,
                  color: context.customAppColors.primary700,
                ),
                SizedBox(width: 6.w),
                Text(
                  mealType.label(context),
                  style: AppTextStyles.font12SemiBold.copyWith(
                    color: context.customAppColors.primary700,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        FadeInUp(
          delay: const Duration(milliseconds: 100),
          child: Text(
            analysis.name,
            style: AppTextStyles.font18Bold.copyWith(
              color: context.customAppColors.neutral900,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        FadeInUp(
          delay: const Duration(milliseconds: 150),
          child: Text(
            S.of(context).approxEstimateNote,
            style: AppTextStyles.font12Regular.copyWith(
              color: context.customAppColors.grey600,
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
                      S.of(context).caloriesUnit,
                      style: AppTextStyles.font14SemiBold.copyWith(
                        color: context.customAppColors.neutral800,
                      ),
                    ),
                    Text(
                      '${analysis.calories}',
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
                        label: S.of(context).protein,
                        value: analysis.protein,
                        color: context.customAppColors.info700,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: NutrientPill(
                        label: S.of(context).carbs,
                        value: analysis.carbs,
                        color: context.customAppColors.warning500,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: NutrientPill(
                        label: S.of(context).fat,
                        value: analysis.fat,
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
                  onPressed: isSaving ? null : onReset,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    side: BorderSide(color: context.customAppColors.grey300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    S.of(context).retryButton,
                    style: AppTextStyles.font14SemiBold.copyWith(
                      color: context.customAppColors.grey700,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: isSaving ? null : onSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.customAppColors.primary500,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: isSaving
                      ? SizedBox(
                          height: 18.h,
                          width: 18.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.2,
                            valueColor: AlwaysStoppedAnimation(
                              context.customAppColors.white,
                            ),
                          ),
                        )
                      : Text(
                          S.of(context).saveMealButton,
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
