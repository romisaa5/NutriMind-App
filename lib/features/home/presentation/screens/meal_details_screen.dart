import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/home/presentation/widgets/detail_row.dart';
import 'package:nutri_mind/features/home/presentation/widgets/mini_macro_chip.dart';
import 'package:nutri_mind/generated/l10n.dart';

class MealDetailsScreen extends StatelessWidget {
  final MealModel meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final timeLabel = meal.loggedAt != null
        ? DateFormat('hh:mm a').format(meal.loggedAt!)
        : '';

    return Scaffold(
      backgroundColor: context.customAppColors.background,
      appBar: AppBar(
        backgroundColor: context.customAppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: CupertinoNavigationBarBackButton(
          color: context.customAppColors.neutral900,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          s.mealLabel(meal.type.label(context)),
          style: AppTextStyles.font16Bold.copyWith(
            color: context.customAppColors.neutral900,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 40.h),
          children: [
            // ---------------- Header ----------------
            FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: context.customAppColors.greenGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(26.r),
                  boxShadow: [
                    BoxShadow(
                      color: context.customAppColors.primary700.withValues(
                        alpha: 0.3,
                      ),
                      blurRadius: 22,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56.w,
                      height: 56.w,
                      decoration: BoxDecoration(
                        color: context.customAppColors.white.withValues(
                          alpha: 0.18,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        meal.type.icon,
                        color: context.customAppColors.white,
                        size: 28.sp,
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.font16Bold.copyWith(
                              color: context.customAppColors.white,
                            ),
                          ),
                          if (timeLabel.isNotEmpty) ...[
                            SizedBox(height: 4.h),
                            Text(
                              timeLabel,
                              style: AppTextStyles.font12Regular.copyWith(
                                color: context.customAppColors.white.withValues(
                                  alpha: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            FadeInUp(
              delay: const Duration(milliseconds: 100),
              duration: const Duration(milliseconds: 500),
              child: SoftCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${meal.calories ?? 0}',
                          style: AppTextStyles.font32Bold.copyWith(
                            color: context.customAppColors.neutral900,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            s.caloriesUnit,
                            style: AppTextStyles.font14Regular.copyWith(
                              color: context.customAppColors.neutral700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        MiniMacroChip(
                          label: s.protein,
                          value: meal.protein ?? 0,
                          color: context.customAppColors.info700,
                        ),
                        SizedBox(width: 8.w),
                        MiniMacroChip(
                          label: s.carbs,
                          value: meal.carbs ?? 0,
                          color: context.customAppColors.warning500,
                        ),
                        SizedBox(width: 8.w),
                        MiniMacroChip(
                          label: s.fat,
                          value: meal.fat ?? 0,
                          color: context.customAppColors.accent700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.h),
            FadeInUp(
              delay: const Duration(milliseconds: 150),
              duration: const Duration(milliseconds: 500),
              child: SoftCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.mealDetailsMoreInfo,
                      style: AppTextStyles.font14Bold.copyWith(
                        color: context.customAppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    DetailRow(
                      icon: Icons.grass_rounded,
                      label: s.fiber,
                      value: '${meal.fiber ?? 0}g',
                      color: context.customAppColors.primary700,
                    ),
                    Divider(
                      color: context.customAppColors.grey100,
                      height: 22.h,
                    ),
                    DetailRow(
                      icon: Icons.icecream_rounded,
                      label: s.sugar,
                      value: '${meal.sugar ?? 0}g',
                      color: context.customAppColors.warning500,
                    ),
                    Divider(
                      color: context.customAppColors.grey100,
                      height: 22.h,
                    ),
                    DetailRow(
                      icon: Icons.water_rounded,
                      label: s.sodium,
                      value: '${meal.sodium ?? 0}mg',
                      color: context.customAppColors.info700,
                    ),
                  ],
                ),
              ),
            ),
            if ((meal.advice ?? '').isNotEmpty) ...[
              SizedBox(height: 16.h),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 500),
                child: Container(
                  padding: EdgeInsets.all(18.r),
                  decoration: BoxDecoration(
                    color: context.customAppColors.primary100,
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 34.w,
                        height: 34.w,
                        decoration: BoxDecoration(
                          color: context.customAppColors.primary500,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.lightbulb_rounded,
                          color: context.customAppColors.white,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              s.mealDetailsAdviceTitle,
                              style: AppTextStyles.font14Bold.copyWith(
                                color: context.customAppColors.primary700,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              meal.advice ?? '',
                              style: AppTextStyles.font13Regular.copyWith(
                                color: context.customAppColors.grey900,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
