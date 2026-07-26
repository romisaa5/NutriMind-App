import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/theme/app_colors/light_app_colors.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageModel message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        constraints: BoxConstraints(maxWidth: 0.75.sw),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isUser
              ? LightAppColors.primary500
              : context.customAppColors.neutral100,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(18.r),
            topEnd: Radius.circular(18.r),
            bottomStart: Radius.circular(isUser ? 18.r : 4.r),
            bottomEnd: Radius.circular(isUser ? 4.r : 18.r),
          ),
          boxShadow: [
            BoxShadow(
              color:
                  (isUser
                          ? LightAppColors.primary500
                          : context.customAppColors.neutral400)
                      .withValues(alpha: 0.18),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          message.text,
          style: AppTextStyles.font14Regular.copyWith(
            color: isUser
                ? context.customAppColors.white
                : context.customAppColors.neutral800,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
