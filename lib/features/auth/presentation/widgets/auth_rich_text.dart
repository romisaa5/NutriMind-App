import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';

class AuthRichText extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const AuthRichText({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: AppTextStyles.font14Regular.copyWith(
          color: context.customAppColors.neutral700,
        ),
        children: [
          TextSpan(
            text: actionText,
            style: AppTextStyles.font14Regular.copyWith(
              color: context.customAppColors.primary500,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
