import 'package:animate_do/animate_do.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_mind/core/common/widgets/app_images.dart';
import 'package:nutri_mind/core/common/widgets/custom_button.dart';
import 'package:nutri_mind/core/common/widgets/custom_text_form_field.dart';
import 'package:nutri_mind/core/helpers/app_validators.dart';
import 'package:nutri_mind/core/routing/routes.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nutri_mind/features/auth/presentation/widgets/auth_rich_text.dart';
import 'package:nutri_mind/features/auth/presentation/widgets/top_auth_banner.dart';
import 'package:nutri_mind/generated/l10n.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  static const _stagger = Duration(milliseconds: 90);
  static const _baseDuration = Duration(milliseconds: 550);

  Duration _delay(int step) => _stagger * step;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
        } else if (state is AuthSuccess) {
          _showTopBar(message: S.of(context).signUp, isError: false);
          GoRouter.of(context).go(Routes.verifyEmailScreen);
        }
      },
      child: Scaffold(
        backgroundColor: context.customAppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ElasticIn(
                        duration: 900.ms,
                        child: AppImages(
                          imagePath: 'app_image.png',
                          width: 200.w,
                          height: 200.h,
                        ),
                      ),
                    ),
                    FadeInUp(
                      delay: _delay(2),
                      duration: _baseDuration,
                      child: Text(
                        S.of(context).signUpHeader,
                        style: AppTextStyles.font32Bold.copyWith(
                          color: context.customAppColors.neutral900,
                        ),
                      ),
                    ),
                    10.h.ph,
                    FadeInUp(
                      delay: _delay(3),
                      duration: _baseDuration,
                      child: Text(
                        S.of(context).signUpMessage,
                        style: AppTextStyles.font18Regular.copyWith(
                          color: context.customAppColors.neutral700,
                        ),
                      ),
                    ),
                    24.h.ph,
                    FadeInUp(
                      delay: _delay(4),
                      duration: _baseDuration,
                      child: AppTextFormField(
                        controller: _nameController,
                        hintText: S.of(context).name,
                        keyboardType: TextInputType.name,
                        validator: (value) => AppValidators.validateName(value),
                      ),
                    ),
                    16.h.ph,
                    FadeInUp(
                      delay: _delay(5),
                      duration: _baseDuration,
                      child: AppTextFormField(
                        controller: _emailController,
                        hintText: S.of(context).email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            AppValidators.validateEmail(value),
                      ),
                    ),
                    16.h.ph,
                    FadeInUp(
                      delay: _delay(6),
                      duration: _baseDuration,
                      child: AppTextFormField(
                        controller: _passwordController,
                        hintText: S.of(context).password,
                        isObscureText: true,
                        validator: (value) =>
                            AppValidators.validatePassword(value),
                      ),
                    ),
                    24.h.ph,
                    FadeInUp(
                      delay: _delay(7),
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
                                    if (_formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().register(
                                        name: _nameController.text.trim(),
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text,
                                      );
                                    }
                                  },
                            text: S.of(context).signUp,
                          );
                        },
                      ),
                    ),
                    24.h.ph,
                    FadeIn(
                      delay: _delay(8),
                      duration: _baseDuration,
                      child: Center(
                        child: AuthRichText(
                          title: S.of(context).alreadyHaveAccount,
                          actionText: S.of(context).login,
                          onTap: () {
                            GoRouter.of(context).push(Routes.loginScreen);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
