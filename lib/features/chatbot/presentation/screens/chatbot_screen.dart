import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/di/service_locator.dart';
import 'package:nutri_mind/core/error/failure_localization.dart';
import 'package:nutri_mind/core/helpers/extensions.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/features/chatbot/data/repo/chat_repository.dart';
import 'package:nutri_mind/features/chatbot/presentation/cubit/chat_cubit.dart';
import 'package:nutri_mind/features/chatbot/presentation/widgets/chat_bubble.dart';
import 'package:nutri_mind/generated/l10n.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(getIt<ChatRepository>()),
      child: const _ChatbotView(),
    );
  }
}

class _ChatbotView extends StatefulWidget {
  const _ChatbotView();

  @override
  State<_ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<_ChatbotView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _welcomeInitialized = false;

  void _send(String text) {
    if (text.trim().isEmpty) return;
    context.read<ChatCubit>().sendMessage(text);
    _controller.clear();
  }

  void _scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    if (!_welcomeInitialized) {
      _welcomeInitialized = true;
      context.read<ChatCubit>().initWelcomeMessage(s.chatbotWelcomeMessage);
    }

    final suggestions = [
      s.chatbotSuggestionOverate,
      s.chatbotSuggestionHealthyMeal,
      s.chatbotSuggestionAnxiety,
    ];

    return Scaffold(
      backgroundColor: context.customAppColors.background,
      appBar: AppBar(
        backgroundColor: context.customAppColors.background,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: context.customAppColors.greenGradient,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: context.customAppColors.primary500.withValues(
                      alpha: 0.35,
                    ),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.smart_toy_rounded,
                color: context.customAppColors.white,
                size: 19.sp,
              ),
            ),
            20.w.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  s.chatbotAppBarTitle,
                  style: AppTextStyles.font16Bold.copyWith(
                    color: context.customAppColors.neutral900,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: BoxDecoration(
                        color: context.customAppColors.primary500,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      s.chatbotOnlineStatus,
                      style: AppTextStyles.font12Regular.copyWith(
                        color: context.customAppColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          _scrollToEnd();
          final failure = state.error;
          if (failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(failure.localizedMessage(context))),
            );
            context.read<ChatCubit>().clearError();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                  itemCount: state.messages.length + (state.isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (state.isTyping && index == state.messages.length) {
                      return FadeIn(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: context.customAppColors.neutral100,
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(18.r),
                                topEnd: Radius.circular(18.r),
                                bottomEnd: Radius.circular(18.r),
                                bottomStart: Radius.circular(4.r),
                              ),
                            ),
                            child: const TypingDots(),
                          ),
                        ),
                      );
                    }
                    final msg = state.messages[index];
                    return FadeInUp(
                      duration: const Duration(milliseconds: 350),
                      child: ChatBubble(message: msg),
                    );
                  },
                ),
              ),
              if (state.messages.length <= 1)
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: 42.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: suggestions.length,
                      separatorBuilder: (_, a) => SizedBox(width: 8.w),
                      itemBuilder: (context, i) => ActionChip(
                        onPressed: () => _send(suggestions[i]),
                        avatar: Icon(
                          Icons.auto_awesome_rounded,
                          size: 14.sp,
                          color: context.customAppColors.primary700,
                        ),
                        label: Text(
                          suggestions[i],
                          style: AppTextStyles.font12Regular.copyWith(
                            color: context.customAppColors.primary800,
                          ),
                        ),
                        backgroundColor: context.customAppColors.primary100,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  ),
                ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: context.customAppColors.neutral100,
                            borderRadius: BorderRadius.circular(26.r),
                          ),
                          child: TextField(
                            controller: _controller,
                            style: AppTextStyles.font14Regular.copyWith(
                              color: context.customAppColors.neutral900,
                            ),
                            decoration: InputDecoration(
                              hintText: s.chatbotInputHint,
                              hintStyle: AppTextStyles.font14Regular.copyWith(
                                color: context.customAppColors.neutral700,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14.h,
                              ),
                            ),
                            onSubmitted: _send,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Material(
                        color: context.customAppColors.primary500,
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: state.isTyping
                              ? null
                              : () => _send(_controller.text),
                          child: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: Icon(
                              Icons.send_rounded,
                              color: context.customAppColors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
