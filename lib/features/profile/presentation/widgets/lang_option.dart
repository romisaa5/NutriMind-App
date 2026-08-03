import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';

class LangOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const LangOption({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: AppTextStyles.font14SemiBold.copyWith(
          color: selected
              ? context.customAppColors.white
              : context.customAppColors.neutral700,
        ),
        child: Center(child: Text(label)),
      ),
    );
  }
}
