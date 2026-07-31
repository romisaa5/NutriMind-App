/// كل أنواع الأخطاء الممكنة في التطبيق - كـ "كود" مش نص جاهز
/// عشان الترجمة الفعلية تحصل بس في الـ UI (لما يكون فيه BuildContext)
enum FailureCode {
  // ---------- Auth ----------
  emailAlreadyInUse,
  invalidEmail,
  weakPassword,
  wrongCredentials,
  userDisabled,
  tooManyRequests,
  networkError,
  requiresRecentLogin,
  logoutFailed,
  verificationEmailFailed,
  deleteAccountFailed,

  // ---------- Firestore ----------
  firestoreSaveFailed,
  firestoreAddFailed,
  firestoreUpdateFailed,
  firestoreDeleteFailed,
  firestoreFetchFailed,
  userDataNotFound,

  // ---------- Gemini ----------
  emptyImage,
  emptyAnalysisResponse,
  invalidAnalysisFormat,
  analysisError,

  // ---------- Chatbot (Groq) ----------
  chatRequestFailed,
  chatEmptyResponse,

  // ---------- Generic ----------
  unknown,
}

/// طبقة موحدة لأنواع الأخطاء في التطبيق كله
/// الـ debugMessage ده نص تقني للـ logs بس - مبيتعرضش للمستخدم أبدًا
/// المستخدم بيشوف بس النص المترجم اللي جاي من [code] عن طريق
/// FailureLocalizationX.localizedMessage(context) في الـ UI
abstract class Failure {
  final FailureCode code;
  final String? debugMessage;
  const Failure(this.code, [this.debugMessage]);

  @override
  String toString() => debugMessage ?? code.name;
}

class AuthFailure extends Failure {
  const AuthFailure(super.code, [super.debugMessage]);
}

class FirestoreFailure extends Failure {
  const FirestoreFailure(super.code, [super.debugMessage]);
}

class GeminiFailure extends Failure {
  const GeminiFailure(super.code, [super.debugMessage]);
}

class ChatFailure extends Failure {
  const ChatFailure(super.code, [super.debugMessage]);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.code, [super.debugMessage]);
}

class UnknownFailure extends Failure {
  const UnknownFailure([String? debugMessage])
      : super(FailureCode.unknown, debugMessage);
}
