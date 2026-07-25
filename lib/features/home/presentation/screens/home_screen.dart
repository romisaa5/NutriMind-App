import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/features/home/presentation/widgets/meal_card.dart';
import 'package:nutri_mind/features/home/presentation/widgets/nutrition_overview_card.dart';
import 'package:nutri_mind/features/home/presentation/widgets/weekly_trend_card.dart';
import 'package:nutri_mind/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meals = DummyData.todayMeals;

    const int calorieGoal = 1800;
    const int proteinGoal = 90;
    const int carbsGoal = 220;
    const int fatGoal = 60;
    final int consumed = meals.fold(0, (sum, m) => sum + (m.calories ?? 0));
    final int protein = meals.fold(0, (sum, m) => sum + (m.protein ?? 0));
    final int carbs = meals.fold(0, (sum, m) => sum + (m.carbs ?? 0));
    final int fat = meals.fold(0, (sum, m) => sum + (m.fat ?? 0));

    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 110.h),
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).goodMorning,
                        style: AppTextStyles.font20Bold.copyWith(
                          color: context.customAppColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          S.of(context).newDayNewStep,
                          style: AppTextStyles.font13Regular.copyWith(
                            color: context.customAppColors.neutral700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: context.customAppColors.warning500.withValues(
                            alpha: 0.15,
                          ),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_fire_department_rounded,
                              color: context.customAppColors.warning500,
                              size: 16.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '3',
                              style: AppTextStyles.font12Bold.copyWith(
                                color: context.customAppColors.warning500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 44.w,
                        height: 44.w,
                        decoration: BoxDecoration(
                          color: context.customAppColors.primary100,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Icon(
                          Icons.notifications_none_rounded,
                          color: context.customAppColors.primary700,
                          size: 22.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 22.h),
            FadeInUp(
              delay: const Duration(milliseconds: 100),
              duration: const Duration(milliseconds: 550),
              child: NutritionOverviewCard(
                consumed: consumed,
                calorieGoal: calorieGoal,
                protein: protein,
                proteinGoal: proteinGoal,
                carbs: carbs,
                carbsGoal: carbsGoal,
                fat: fat,
                fatGoal: fatGoal,
              ),
            ),

            SizedBox(height: 20.h),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              duration: const Duration(milliseconds: 550),
              child: WeeklyTrendCard(data: DummyData.weeklyCalories),
            ),

            SizedBox(height: 28.h),

            FadeInLeft(
              delay: const Duration(milliseconds: 150),
              child: Text(
                S.of(context).todayMeals,
                style: AppTextStyles.font18Bold.copyWith(
                  color: context.customAppColors.neutral900,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            ...List.generate(meals.length, (index) {
              final meal = meals[index];
              return FadeInUp(
                delay: Duration(milliseconds: 250 + (index * 100)),
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 14.h),
                  child: MealCard(meal: meal),
                ),
              );
            }),

            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
