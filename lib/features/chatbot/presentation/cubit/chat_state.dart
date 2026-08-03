part of 'chat_cubit.dart';

class ChatState {
  final List<ChatMessageModel> messages;
  final bool isTyping;
  final Failure? error;

  const ChatState({
    this.messages = const [],
    this.isTyping = false,
    this.error,
  });

  ChatState copyWith({
    List<ChatMessageModel>? messages,
    bool? isTyping,
    Failure? error,
    bool clearError = false,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
      error: clearError ? null : (error ?? this.error),
    );
  }
}
