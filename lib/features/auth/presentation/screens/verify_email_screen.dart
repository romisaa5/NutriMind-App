import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_mind/core/common/widgets/app_images.dart';
import 'package:nutri_mind/core/common/widgets/custom_button.dart';
import 'package:nutri_mind/core/routing/routes.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nutri_mind/features/auth/presentation/widgets/top_auth_banner.dart';
import 'package:nutri_mind/generated/l10n.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  static const _stagger = Duration(milliseconds: 90);
  static const _baseDuration = Duration(milliseconds: 550);
  Duration _delay(int step) => _stagger * step;

  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    _pollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      context.read<AuthCubit>().checkEmailVerification();
    });
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          _showTopBar(message: state.message, isError: true);
        } else if (state is VerificationEmailSent) {
          _showTopBar(
            message: S.of(context).verificationEmailSent,
            isError: false,
          );
        } else if (state is EmailVerified) {
          _pollTimer?.cancel();
          _showTopBar(message: S.of(context).emailVerified, isError: false);
          GoRouter.of(context).go(Routes.mainNavScreen);
        }
      },
      child: Scaffold(
        backgroundColor: context.customAppColors.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElasticIn(
                  duration: 900.ms,
                  child: AppImages(
                    imagePath: 'app_image.png',
                    width: 200.w,
                    height: 200.h,
                  ),
                ),
                24.h.ph,
                FadeInUp(
                  delay: _delay(2),
                  duration: _baseDuration,
                  child: Text(
                    S.of(context).verifyEmailHeader,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font24Bold.copyWith(
                      color: context.customAppColors.neutral900,
                    ),
                  ),
                ),
                10.h.ph,
                FadeInUp(
                  delay: _delay(3),
                  duration: _baseDuration,
                  child: Text(
                    S.of(context).verifyEmailMessage,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font16Regular.copyWith(
                      color: context.customAppColors.neutral700,
                    ),
                  ),
                ),
                32.h.ph,
                FadeInUp(
                  delay: _delay(4),
                  duration: _baseDuration,
                  child: BlocBuilder<AuthCubit, AuthState>(
                    buildWhen: (previous, current) =>
                        previous is AuthLoading || current is AuthLoading,
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;
                      return CustomButton(
                        isLoading: isLoading,
                        onTap: isLoading
                            ? null
                            : () {
                                context
                                    .read<AuthCubit>()
                                    .sendVerificationEmail();
                              },
                        text: S.of(context).resendVerificationEmail,
                      );
                    },
                  ),
                ),
                16.h.ph,
                FadeIn(
                  delay: _delay(5),
                  duration: _baseDuration,
                  child: CupertinoButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                      GoRouter.of(context).go(Routes.loginScreen);
                    },
                    child: Text(
                      S.of(context).backToLogin,
                      style: AppTextStyles.font14Regular.copyWith(
                        color: context.customAppColors.primary500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
