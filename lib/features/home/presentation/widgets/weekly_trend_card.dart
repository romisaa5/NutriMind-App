import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/generated/l10n.dart';

class WeeklyTrendCard extends StatelessWidget {
  final List<WeeklyCalorieEntry> data;
  const WeeklyTrendCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final double maxCalories = data
        .map((e) => e.calories)
        .reduce(math.max)
        .toDouble();
    final double maxY = maxCalories * 1.25;

    return SoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).weeklyOverview,
                style: AppTextStyles.font14Bold.copyWith(
                  color: context.customAppColors.neutral900,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: context.customAppColors.primary100,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  S.of(context).last7Days,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: context.customAppColors.primary700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          SizedBox(
            height: 140.h,
            child: BarChart(
              BarChartData(
                maxY: maxY,
                alignment: BarChartAlignment.spaceAround,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 26.h,
                      getTitlesWidget: (value, meta) {
                        final int idx = value.toInt();
                        if (idx < 0 || idx >= data.length)
                          return const SizedBox.shrink();
                        final bool isToday = idx == data.length - 1;
                        return Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: Text(
                            S.of(context).dayLabel(data[idx].dayKey),
                            style: AppTextStyles.font12Regular.copyWith(
                              color: isToday
                                  ? context.customAppColors.primary700
                                  : context.customAppColors.neutral700,
                              fontWeight: isToday
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => context.customAppColors.neutral900,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                        BarTooltipItem(
                          S.of(context).caloriesTooltip(rod.toY.toInt()),
                          AppTextStyles.font12SemiBold.copyWith(
                            color: context.customAppColors.neutral100,
                          ),
                        ),
                  ),
                ),
                barGroups: List.generate(data.length, (i) {
                  final bool isToday = i == data.length - 1;
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: data[i].calories.toDouble(),
                        width: 18.w,
                        borderRadius: BorderRadius.circular(6.r),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: isToday
                              ? context.customAppColors.greenGradient
                              : [
                                  context.customAppColors.grey200,
                                  context.customAppColors.grey300,
                                ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
              swapAnimationDuration: const Duration(milliseconds: 700),
              swapAnimationCurve: Curves.easeOutCubic,
            ),
          ),
        ],
      ),
    );
  }
}
