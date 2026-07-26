import 'package:nutri_mind/core/utils/common_imports.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color background;
  final Color iconColor;
  final double size;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.background,
    required this.iconColor,
    this.size = 52,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(size / 4.5),
          child: Icon(icon, color: iconColor, size: (size / 2.2).sp),
        ),
      ),
    );
  }
}
