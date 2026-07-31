import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/routing/routes.dart';
import 'package:nutri_mind/core/theme/app_colors/light_app_colors.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_cubit.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nutri_mind/features/auth/presentation/widgets/top_auth_banner.dart';
import 'package:nutri_mind/features/profile/presentation/cubit/local_cubit.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:nutri_mind/generated/l10n.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _showTopBar({required String message, required bool isError}) {
      showTopSnackBar(
        Overlay.of(context),
        isError
            ? FadeInDown(
                duration: 500.ms,
                child: TopAuthBanner(message: message, isError: true),
              )
            : BounceInDown(
                duration: 600.ms,
                child: TopAuthBanner(message: message, isError: false),
              ),
        animationDuration: 600.ms,
        displayDuration: 2500.ms,
      );
    }

    final s = S.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOut) {
          context.go(Routes.loginScreen);
        }
        if (state is AuthError) {
          _showTopBar(message: state.failure.debugMessage ?? '', isError: true);
        }
      },
      child: Scaffold(
        backgroundColor: context.customAppColors.background,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 40.h),
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  s.profileTitle,
                  style: AppTextStyles.font20Bold.copyWith(
                    color: context.customAppColors.neutral900,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              FadeInUp(
                delay: const Duration(milliseconds: 100),
                duration: const Duration(milliseconds: 550),
                child: const _ProfileHeaderCard(),
              ),

              SizedBox(height: 26.h),

              FadeInLeft(
                delay: const Duration(milliseconds: 150),
                child: _SectionLabel(text: s.profileSettingsSection),
              ),

              SizedBox(height: 12.h),

              FadeInUp(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 550),
                child: const _LanguageCard(),
              ),

              SizedBox(height: 12.h),

              FadeInUp(
                delay: const Duration(milliseconds: 230),
                duration: const Duration(milliseconds: 550),
                child: const _ThemeCard(),
              ),

              SizedBox(height: 12.h),

              FadeInUp(
                delay: const Duration(milliseconds: 250),
                duration: const Duration(milliseconds: 550),
                child: SoftCard(
                  child: Column(
                    children: [
                      _SettingsRow(
                        icon: Icons.notifications_none_rounded,
                        label: s.profileNotificationsTitle,
                        onTap: () {},
                      ),

                      Divider(
                        color: context.customAppColors.grey300,
                        height: 24.h,
                      ),

                      _SettingsRow(
                        icon: Icons.info_outline_rounded,
                        label: s.profileAboutTitle,
                        onTap: () {
                          GoRouter.of(context).push(Routes.aboutScreen);
                        },
                      ),

                      Divider(
                        color: context.customAppColors.grey300,
                        height: 24.h,
                      ),

                      _SettingsRow(
                        icon: Icons.logout_rounded,
                        label: s.profileLogoutTitle,
                        iconColor: LightAppColors.error500,
                        labelColor: LightAppColors.error500,
                        onTap: () async {
                          final result = await showLogoutConfirmationDialog(
                            context,
                          );

                          if (result == true && context.mounted) {
                            context.read<AuthCubit>().logout();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.font14SemiBold.copyWith(
        color: context.customAppColors.neutral700,
      ),
    );
  }
}

class _ProfileHeaderCard extends StatelessWidget {
  const _ProfileHeaderCard();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    const userName = 'Romisaa Fadel';
    const userEmail = 'romisaafadel@email.com';

    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            LightAppColors.primary900,
            context.customAppColors.primary700,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: [
          BoxShadow(
            color: context.customAppColors.primary700.withValues(alpha: 0.3),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: context.customAppColors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.customAppColors.white.withValues(alpha: 0.4),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: context.customAppColors.white,
                  size: 32.sp,
                ),
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: context.customAppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.customAppColors.primary700,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    size: 12.sp,
                    color: context.customAppColors.primary700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppTextStyles.font16Bold.copyWith(
                    color: context.customAppColors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  userEmail,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: context.customAppColors.white.withValues(
                      alpha: 0.75,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: context.customAppColors.white.withValues(
                      alpha: 0.15,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    s.profileEditProfile,
                    style: AppTextStyles.font12SemiBold.copyWith(
                      color: context.customAppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: context.customAppColors.primary100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.language_rounded,
                  color: context.customAppColors.primary700,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.profileLanguageTitle,
                      style: AppTextStyles.font14Bold.copyWith(
                        color: context.customAppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      s.profileLanguageSubtitle,
                      style: AppTextStyles.font12Regular.copyWith(
                        color: context.customAppColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const _LanguageSegmentedControl(),
        ],
      ),
    );
  }
}

class _LanguageSegmentedControl extends StatelessWidget {
  const _LanguageSegmentedControl();

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
                      child: _LangOption(
                        label: 'العربية',
                        selected: isArabic,
                        onTap: () => context.read<LocaleCubit>().toArabic(),
                      ),
                    ),
                    Expanded(
                      child: _LangOption(
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

class _LangOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _LangOption({
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

class _ThemeCard extends StatelessWidget {
  const _ThemeCard();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: context.customAppColors.primary100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, mode) => Icon(
                    context.read<ThemeCubit>().currentThemeIcon,
                    color: context.customAppColors.primary700,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.profileThemeTitle,
                      style: AppTextStyles.font14Bold.copyWith(
                        color: context.customAppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      s.profileThemeSubtitle,
                      style: AppTextStyles.font12Regular.copyWith(
                        color: context.customAppColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const _ThemeSegmentedControl(),
        ],
      ),
    );
  }
}

class _ThemeSegmentedControl extends StatelessWidget {
  const _ThemeSegmentedControl();

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
                      child: _ThemeOption(
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

class _ThemeOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? context.customAppColors.white
        : context.customAppColors.neutral700;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          4.h.ph,
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(icon, key: ValueKey(icon), size: 18.sp, color: color),
          ),
          SizedBox(height: 3.h),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTextStyles.font12SemiBold.copyWith(color: color),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final Color? labelColor;
  final VoidCallback onTap;

  const _SettingsRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: iconColor ?? context.customAppColors.neutral700,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.font14Regular.copyWith(
                color: labelColor ?? context.customAppColors.neutral800,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14.sp,
            color: context.customAppColors.grey400,
          ),
        ],
      ),
    );
  }
}
