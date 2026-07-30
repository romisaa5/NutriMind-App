import 'package:fl_chart/fl_chart.dart';
import 'package:nutri_mind/core/theme/app_colors/light_app_colors.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import '../../../../core/utils/common_imports.dart';

class MacroMiniDonut extends StatelessWidget {
  final String label;
  final int value;
  final int goal;
  final Color color;
  final IconData icon;

  const MacroMiniDonut({
    super.key,
    required this.label,
    required this.value,
    required this.goal,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = goal == 0
        ? 0
        : (value / goal).clamp(0, 1).toDouble();

    return Row(
      children: [
        SizedBox(
          width: 38.w,
          height: 38.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  startDegreeOffset: -90,
                  sectionsSpace: 0,
                  centerSpaceRadius: 11.r,
                  sections: [
                    PieChartSectionData(
                      value: progress * 100,
                      color: color,
                      radius: 6.r,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: (1 - progress) * 100,
                      color: LightAppColors.white.withValues(alpha: 0.15),
                      radius: 6.r,
                      showTitle: false,
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
              ),
              Icon(icon, color: color, size: 14.sp),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.font12Regular.copyWith(
                  color: LightAppColors.white.withValues(alpha: 0.7),
                ),
              ),
              Text(
                '${value}g / ${goal}g',
                style: AppTextStyles.font12SemiBold.copyWith(
                  color: LightAppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
