import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/generated/l10n.dart';

class NutrientPill extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  const NutrientPill({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          Text(
            S.of(context).scanGramValue(value),
            style: AppTextStyles.font16Bold.copyWith(color: color),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: AppTextStyles.font12Regular.copyWith(
              color: context.customAppColors.neutral700,
            ),
          ),
        ],
      ),
    );
  }
}
