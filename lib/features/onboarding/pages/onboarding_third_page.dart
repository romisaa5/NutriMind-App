import 'package:nutri_mind/core/common/widgets/custom_button.dart';
import 'package:nutri_mind/core/helpers/shared_pref_helper.dart';
import 'package:nutri_mind/core/routing/routes.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/features/onboarding/widgets/onboarding_header.dart';
import 'package:nutri_mind/features/onboarding/widgets/wave_background.dart';
import 'package:nutri_mind/generated/l10n.dart';

import '../../../core/utils/common_imports.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(bottom: 0, left: 0, right: 0, child: WaveBackground()),
        Column(
          children: [
            OnboardingHeader(
              titleLine1: S.of(context).onboarding3_title_line1,
              titleLine2: S.of(context).onboarding3_title_line2,
              description: S.of(context).onboarding3_description,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: context.customAppColors.neutral100,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .06),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      12.h.ph,
                      _ChatBubble(
                        isBot: true,
                        text: S.of(context).chat_welcome,
                      ),
                      const SizedBox(height: 12),
                      _ChatBubble(
                        isBot: false,
                        text: S.of(context).chat_question,
                      ),
                      12.h.ph,
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: context.customAppColors.primary100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).chat_answer_intro,
                              style: TextStyle(
                                fontSize: 13,
                                color: context.customAppColors.grey900,
                                height: 1.4,
                              ),
                            ),
                            SizedBox(height: 8),
                            _CheckItem(text: S.of(context).snack_greek_yogurt),
                            _CheckItem(
                              text: S.of(context).snack_protein_smoothie,
                            ),
                            _CheckItem(text: S.of(context).snack_boiled_eggs),
                            _CheckItem(
                              text: S.of(context).snack_cottage_cheese,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            20.h.ph,
            Padding(
              padding: EdgeInsets.all(16.w),
              child: CustomButton(
                onTap: () {
                  SharedPrefHelper.setData(
                    key: 'has_seen_onboarding',
                    value: true,
                  );
                  GoRouter.of(context).go(Routes.loginScreen);
                },
                text: S.of(context).get_started,
              ),
            ),
            50.h.ph,
          ],
        ),
      ],
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final bool isBot;
  final String text;

  const _ChatBubble({required this.isBot, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isBot
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isBot) ...[const _Avatar(isBot: true), const SizedBox(width: 8)],
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isBot
                  ? context.customAppColors.primary100
                  : context.customAppColors.primary500,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isBot ? 4 : 16),
                bottomRight: Radius.circular(isBot ? 16 : 4),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: isBot ? context.customAppColors.grey900 : Colors.white,
              ),
            ),
          ),
        ),
        if (!isBot) ...[const SizedBox(width: 8), const _Avatar(isBot: false)],
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final bool isBot;
  const _Avatar({required this.isBot});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: isBot
          ? context.customAppColors.primary300
          : context.customAppColors.primary500.withValues(alpha: .15),
      child: Icon(
        isBot ? Icons.smart_toy_rounded : Icons.person_rounded,
        size: 18,
        color: context.customAppColors.primary600,
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String text;
  const _CheckItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_rounded,
            size: 16,
            color: context.customAppColors.primary500,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.5,
                color: context.customAppColors.grey900,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
