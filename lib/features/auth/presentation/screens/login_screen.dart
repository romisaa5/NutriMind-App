import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nutri_mind/core/common/widgets/app_images.dart';
import 'package:nutri_mind/core/common/widgets/custom_button.dart';
import 'package:nutri_mind/core/common/widgets/custom_text_form_field.dart';
import 'package:nutri_mind/core/helpers/app_validators.dart';
import 'package:nutri_mind/core/routing/routes.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/auth/presentation/widgets/auth_rich_text.dart';
import 'package:nutri_mind/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  static const _stagger = Duration(milliseconds: 90);
  static const _baseDuration = Duration(milliseconds: 550);
  Duration _delay(int step) => _stagger * step;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.neutral100,
      body: SafeArea(
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
                FadeInDown(
                  delay: _delay(2),
                  duration: _baseDuration,
                  child: Text(
                    S.of(context).login,
                    style: AppTextStyles.font32Bold.copyWith(
                      color: context.customAppColors.neutral900,
                    ),
                  ),
                ),
                10.h.ph,
                FadeInDown(
                  delay: _delay(3),
                  duration: _baseDuration,
                  child: Text(
                    S.of(context).loginMessage,
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
                    controller: _emailController,
                    hintText: S.of(context).email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => AppValidators.validateEmail(value),
                  ),
                ),
                16.h.ph,
                FadeInUp(
                  delay: _delay(5),
                  duration: _baseDuration,
                  child: AppTextFormField(
                    controller: _passwordController,
                    hintText: S.of(context).password,
                    isObscureText: true,
                    validator: (value) => AppValidators.validatePassword(value),
                  ),
                ),
                16.h.ph,
                FadeIn(
                  delay: _delay(6),
                  duration: _baseDuration,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        GoRouter.of(context).push(Routes.forgetPasswordScreen);
                      },
                      child: Text(
                        S.of(context).forgotPassword,
                        style: AppTextStyles.font14Regular.copyWith(
                          color: context.customAppColors.primary500,
                        ),
                      ),
                    ),
                  ),
                ),
                24.h.ph,
                FadeInUp(
                  delay: _delay(7),
                  duration: _baseDuration,
                  child: CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    text: S.of(context).login,
                  ),
                ),
                24.h.ph,
                FadeIn(
                  delay: _delay(8),
                  duration: _baseDuration,
                  child: Center(
                    child: AuthRichText(
                      title: S.of(context).dontHaveAccount,
                      actionText: S.of(context).signUp,
                      onTap: () {
                        GoRouter.of(context).push(Routes.registerScreen);
                      },
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
