import '../../../../core/common/models/app_models.dart';
import '../../../../core/services/groq/groq_chat_service.dart';
import '../../../../core/utils/app_result.dart';

class ChatRepository {
  final GroqChatService _groqChatService;
  ChatRepository(this._groqChatService);

  Future<AppResult<String>> sendMessage({
    required List<ChatMessageModel> history,
    required String newMessage,
  }) {
    return _groqChatService.sendMessage(
      history: history,
      newMessage: newMessage,
    );
  }
}
