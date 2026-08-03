import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/models/app_models.dart';
import '../../../../core/error/failures.dart';
import '../../data/repo/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;

  ChatCubit(this.repository) : super(const ChatState());
  void initWelcomeMessage(String welcomeText) {
    if (state.messages.isNotEmpty) return;
    emit(
      state.copyWith(
        messages: [ChatMessageModel(text: welcomeText, isUser: false)],
      ),
    );
  }

  Future<void> sendMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || state.isTyping) return;
    final history = List<ChatMessageModel>.from(state.messages);

    emit(
      state.copyWith(
        messages: [
          ...state.messages,
          ChatMessageModel(text: trimmed, isUser: true),
        ],
        isTyping: true,
        clearError: true,
      ),
    );

    final result = await repository.sendMessage(
      history: history,
      newMessage: trimmed,
    );

    result.when(
      success: (reply) => emit(
        state.copyWith(
          messages: [
            ...state.messages,
            ChatMessageModel(text: reply, isUser: false),
          ],
          isTyping: false,
        ),
      ),
      error: (failure) => emit(state.copyWith(isTyping: false, error: failure)),
    );
  }

  void clearError() => emit(state.copyWith(clearError: true));
}
