import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_cubit.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/theme_option.dart';
import 'package:nutri_mind/generated/l10n.dart';

class ThemeSegmentedControl extends StatelessWidget {
  const ThemeSegmentedControl({super.key});

  static const _modes = [ThemeMode.light, ThemeMode.dark, ThemeMode.system];

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final labels = {
      ThemeMode.light: s.profileThemeLight,
      ThemeMode.dark: s.profileThemeDark,
      ThemeMode.system: s.profileThemeSystem,
    };
    final icons = {
      ThemeMode.light: Icons.light_mode_rounded,
      ThemeMode.dark: Icons.dark_mode_rounded,
      ThemeMode.system: Icons.brightness_auto_rounded,
    };

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        final selectedIndex = _modes.indexOf(mode);
        final alignmentX = selectedIndex - 1;

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            height: 60.h,
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: context.customAppColors.neutral100,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 280),
                  curve: Curves.easeOutCubic,
                  alignment: Alignment(alignmentX.toDouble(), 0),
                  child: FractionallySizedBox(
                    widthFactor: 1 / 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.customAppColors.primary500,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: context.customAppColors.primary500
                                .withValues(alpha: 0.35),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: _modes.map((m) {
                    final selected = m == mode;
                    return Expanded(
                      child: ThemeOption(
                        icon: icons[m]!,
                        label: labels[m]!,
                        selected: selected,
                        onTap: () => context.read<ThemeCubit>().updateTheme(m),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
