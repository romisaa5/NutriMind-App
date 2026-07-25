import 'package:fl_chart/fl_chart.dart';
import 'package:nutri_mind/core/theme/app_colors/light_app_colors.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/home/presentation/widgets/macro_mini_donut.dart';
import 'package:nutri_mind/generated/l10n.dart';

class NutritionOverviewCard extends StatefulWidget {
  final int consumed;
  final int calorieGoal;
  final int protein;
  final int proteinGoal;
  final int carbs;
  final int carbsGoal;
  final int fat;
  final int fatGoal;

  const NutritionOverviewCard({
    super.key,
    required this.consumed,
    required this.calorieGoal,
    required this.protein,
    required this.proteinGoal,
    required this.carbs,
    required this.carbsGoal,
    required this.fat,
    required this.fatGoal,
  });

  @override
  State<NutritionOverviewCard> createState() => _NutritionOverviewCardState();
}

class _NutritionOverviewCardState extends State<NutritionOverviewCard> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        _progress = widget.calorieGoal == 0
            ? 0
            : (widget.consumed / widget.calorieGoal).clamp(0, 1).toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final int remaining = (widget.calorieGoal - widget.consumed).clamp(
      0,
      widget.calorieGoal,
    );

    return Container(
      padding: EdgeInsets.all(22.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [LightAppColors.primary900, LightAppColors.primary700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: LightAppColors.primary700.withValues(alpha: 0.35),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).todayNutritionSummary,
                    style: AppTextStyles.font16Bold.copyWith(
                      color: LightAppColors.white,
                    ),
                  ),
                  Icon(
                    Icons.bar_chart_rounded,
                    color: LightAppColors.white.withValues(alpha: 0.7),
                    size: 20.sp,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 130.w,
                    height: 130.w,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PieChart(
                          PieChartData(
                            startDegreeOffset: -90,
                            sectionsSpace: 0,
                            centerSpaceRadius: 44.r,
                            sections: [
                              PieChartSectionData(
                                value: _progress * 100,
                                color: LightAppColors.white,
                                radius: 16.r,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                value: (1 - _progress) * 100,
                                color: LightAppColors.white.withValues(
                                  alpha: 0.15,
                                ),
                                radius: 16.r,
                                showTitle: false,
                              ),
                            ],
                          ),
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.easeOutCubic,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${widget.consumed}',
                              style: AppTextStyles.font24Bold.copyWith(
                                color: context.customAppColors.white,
                              ),
                            ),
                            Text(
                              S.of(context).caloriesUnit,
                              style: AppTextStyles.font12Regular.copyWith(
                                color: LightAppColors.white.withValues(
                                  alpha: 0.75,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 18.w),

                  Expanded(
                    child: Column(
                      children: [
                        MacroMiniDonut(
                          label: S.of(context).protein,
                          value: widget.protein,
                          goal: widget.proteinGoal,
                          color: context.customAppColors.secondary300,
                          icon: Icons.egg_alt_rounded,
                        ),
                        SizedBox(height: 12.h),
                        MacroMiniDonut(
                          label: S.of(context).carbs,
                          value: widget.carbs,
                          goal: widget.carbsGoal,
                          color: context.customAppColors.warning500,
                          icon: Icons.grain_rounded,
                        ),
                        SizedBox(height: 12.h),
                        MacroMiniDonut(
                          label: S.of(context).fat,
                          value: widget.fat,
                          goal: widget.fatGoal,
                          color: context.customAppColors.accent700,
                          icon: Icons.water_drop_rounded,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: LightAppColors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Center(
                  child: Text(
                    S.of(context).remainingCaloriesMessage(remaining),
                    style: AppTextStyles.font12SemiBold.copyWith(
                      color: LightAppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
