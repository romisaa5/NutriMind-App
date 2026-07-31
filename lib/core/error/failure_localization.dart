import 'package:flutter/widgets.dart';
import 'package:nutri_mind/generated/l10n.dart';
import 'failures.dart';

extension FailureLocalizationX on Failure {
  String localizedMessage(BuildContext context) {
    final s = S.of(context);
    switch (code) {
      case FailureCode.emailAlreadyInUse:
        return s.errorEmailAlreadyInUse;
      case FailureCode.invalidEmail:
        return s.errorInvalidEmail;
      case FailureCode.weakPassword:
        return s.errorWeakPassword;
      case FailureCode.wrongCredentials:
        return s.errorWrongCredentials;
      case FailureCode.userDisabled:
        return s.errorUserDisabled;
      case FailureCode.tooManyRequests:
        return s.errorTooManyRequests;
      case FailureCode.networkError:
        return s.errorNetwork;
      case FailureCode.requiresRecentLogin:
        return s.errorRequiresRecentLogin;
      case FailureCode.logoutFailed:
        return s.errorLogoutFailed;
      case FailureCode.verificationEmailFailed:
        return s.errorVerificationEmailFailed;
      case FailureCode.deleteAccountFailed:
        return s.errorDeleteAccountFailed;
      case FailureCode.firestoreSaveFailed:
        return s.errorFirestoreSave;
      case FailureCode.firestoreAddFailed:
        return s.errorFirestoreAdd;
      case FailureCode.firestoreUpdateFailed:
        return s.errorFirestoreUpdate;
      case FailureCode.firestoreDeleteFailed:
        return s.errorFirestoreDelete;
      case FailureCode.firestoreFetchFailed:
        return s.errorFirestoreFetch;
      case FailureCode.emptyImage:
        return s.errorEmptyImage;
      case FailureCode.emptyAnalysisResponse:
        return s.errorEmptyAnalysisResponse;
      case FailureCode.invalidAnalysisFormat:
        return s.errorInvalidAnalysisFormat;
      case FailureCode.analysisError:
        return s.errorAnalysis;
      case FailureCode.chatRequestFailed:
        return s.errorChatRequestFailed;
      case FailureCode.chatEmptyResponse:
        return s.errorChatEmptyResponse;
      case FailureCode.unknown:
        return s.errorUnknown;
      case FailureCode.userDataNotFound:
        return s.errorUserDataNotFound;
    }
  }
}
