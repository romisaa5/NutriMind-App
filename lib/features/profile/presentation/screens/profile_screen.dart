import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/routing/routes.dart';
import 'package:nutri_mind/core/theme/app_colors/light_app_colors.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nutri_mind/features/auth/presentation/widgets/top_auth_banner.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/language_card.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/profile_header_card.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/section_label.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/settings_row.dart';
import 'package:nutri_mind/features/profile/presentation/widgets/theme_card.dart';
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
                child: const ProfileHeaderCard(),
              ),

              SizedBox(height: 26.h),

              FadeInLeft(
                delay: const Duration(milliseconds: 150),
                child: SectionLabel(text: s.profileSettingsSection),
              ),

              SizedBox(height: 12.h),

              FadeInUp(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 550),
                child: const LanguageCard(),
              ),

              SizedBox(height: 12.h),

              FadeInUp(
                delay: const Duration(milliseconds: 230),
                duration: const Duration(milliseconds: 550),
                child: const ThemeCard(),
              ),

              SizedBox(height: 12.h),

              FadeInUp(
                delay: const Duration(milliseconds: 250),
                duration: const Duration(milliseconds: 550),
                child: SoftCard(
                  child: Column(
                    children: [
                      SettingsRow(
                        icon: Icons.notifications_none_rounded,
                        label: s.profileNotificationsTitle,
                        onTap: () {},
                      ),

                      Divider(
                        color: context.customAppColors.grey300,
                        height: 24.h,
                      ),

                      SettingsRow(
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

                      SettingsRow(
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
