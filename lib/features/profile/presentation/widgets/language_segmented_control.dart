import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/profile/presentation/cubit/local_cubit.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/lang_option.dart';

class LanguageSegmentedControl extends StatelessWidget {
  const LanguageSegmentedControl({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        final isArabic = locale.languageCode == 'ar';

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            height: 52.h,
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
                  alignment: isArabic
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
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
                  children: [
                    Expanded(
                      child: LangOption(
                        label: 'العربية',
                        selected: isArabic,
                        onTap: () => context.read<LocaleCubit>().toArabic(),
                      ),
                    ),
                    Expanded(
                      child: LangOption(
                        label: 'English',
                        selected: !isArabic,
                        onTap: () => context.read<LocaleCubit>().toEnglish(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
