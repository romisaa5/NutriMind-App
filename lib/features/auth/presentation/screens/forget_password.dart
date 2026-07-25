import 'package:animate_do/animate_do.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nutri_mind/core/common/widgets/app_images.dart';
import 'package:nutri_mind/core/common/widgets/custom_button.dart';
import 'package:nutri_mind/core/common/widgets/custom_text_form_field.dart';
import 'package:nutri_mind/core/helpers/app_validators.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/generated/l10n.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // نفس إيقاع اللوجين والريجستر بالظبط عشان رحلة الأوث كلها تحس متسقة
  static const _stagger = Duration(milliseconds: 90);
  static const _baseDuration = Duration(milliseconds: 550);

  Duration _delay(int step) => _stagger * step;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.neutral100,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: context.customAppColors.neutral900,
                    size: 24.sp,
                  ),
                ),
                30.h.ph,
                Center(
                  child: ElasticIn(
                    duration: 900.ms,
                    child: AppImages(
                      imagePath: 'forget_password.png',
                      width: 200.w,
                      height: 250.h,
                    ),
                  ),
                ),
                16.h.ph,
                FadeInUp(
                  delay: _delay(2),
                  duration: _baseDuration,
                  child: Text(
                    S.of(context).forgotPasswordHeader,
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
                    S.of(context).forgotPasswordMessage,
                    style: AppTextStyles.font16Regular.copyWith(
                      color: context.customAppColors.neutral700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                20.h.ph,
                FadeInUp(
                  delay: _delay(4),
                  duration: _baseDuration,
                  child: AppTextFormField(
                    controller: _emailController,
                    hintText: S.of(context).email,
                    validator: (value) => AppValidators.validateEmail(value),
                  ),
                ),
                20.h.ph,
                FadeInUp(
                  delay: _delay(5),
                  duration: _baseDuration,
                  child: CustomButton(
                    text: S.of(context).send,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle send action
                      }
                    },
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
