import 'package:nutri_mind/core/helpers/app_regex.dart';

class AppValidators {
  /// ================== الاسم ==================
  static String? validateName(String? value, {String fieldName = "الاسم"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName مطلوب";
    }
    if (value.trim().length < 2) {
      return "$fieldName يجب أن يحتوي على حرفين على الأقل";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "رقم الهاتف مطلوب";
    }

    final local = RegExp(r'^01[0-9]{9}$');
    final international = RegExp(r'^\+201[0-9]{9}$');

    if (!local.hasMatch(value) && !international.hasMatch(value)) {
      return "رقم هاتف غير صالح";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "البريد الإلكتروني مطلوب";
    }

    if (!AppRegex.isEmailValid(value)) {
      return "البريد الإلكتروني غير صالح";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "كلمة المرور مطلوبة";
    }

    if (!AppRegex.hasMinLength(value)) {
      return "يجب ألا تقل كلمة المرور عن 8 أحرف";
    }
    if (!AppRegex.hasUpperCase(value)) {
      return "يجب أن تحتوي على حرف كبير واحد على الأقل";
    }
    if (!AppRegex.hasLowerCase(value)) {
      return "يجب أن تحتوي على حرف صغير واحد على الأقل";
    }
    if (!AppRegex.hasNumber(value)) {
      return "يجب أن تحتوي على رقم واحد على الأقل";
    }
    if (!AppRegex.hasSpecialCharacter(value)) {
      return "يجب أن تحتوي على رمز خاص";
    }

    return null;
  }

  /// ================== الحقول الاختيارية ==================
  static String? validateRequired(dynamic value, {String fieldName = "الحقل"}) {
    if (value == null) {
      return "يجب اختيار $fieldName";
    }
    return null;
  }

  /// ================== تاريخ الميلاد ==================
  static String? validateBirthDate(DateTime? date) {
    if (date == null) {
      return "يرجى اختيار تاريخ الميلاد";
    }
    return null;
  }

  /// ================== النوع ==================
  static String? validateGender(String? gender) {
    if (gender == null) {
      return "يرجى اختيار النوع";
    }
    return null;
  }
}
