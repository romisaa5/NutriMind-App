import 'package:fl_chart/fl_chart.dart';
import 'package:nutri_mind/core/theme/app_colors/light_app_colors.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import '../../../../core/utils/common_imports.dart';

class MacroMiniDonut extends StatefulWidget {
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
  State<MacroMiniDonut> createState() => _MacroMiniDonutState();
}

class _MacroMiniDonutState extends State<MacroMiniDonut> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        _progress = widget.goal == 0
            ? 0
            : (widget.value / widget.goal).clamp(0, 1).toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      value: _progress * 100,
                      color: widget.color,
                      radius: 6.r,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: (1 - _progress) * 100,
                      color: LightAppColors.white.withValues(alpha: 0.15),
                      radius: 6.r,
                      showTitle: false,
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
              ),
              Icon(widget.icon, color: widget.color, size: 14.sp),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: AppTextStyles.font12Regular.copyWith(
                  color: LightAppColors.white.withValues(alpha: 0.7),
                ),
              ),
              Text(
                '${widget.value}g / ${widget.goal}g',
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
