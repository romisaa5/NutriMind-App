import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en')) {
    _loadSavedLocale();
  }

  static const _prefsKey = 'app_locale_code';

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString(_prefsKey);
    if (savedCode != null && savedCode != state.languageCode) {
      emit(Locale(savedCode));
    }
  }

  Future<void> changeLocale(Locale locale) async {
    if (state.languageCode == locale.languageCode) return;
    emit(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, locale.languageCode);
  }

  void toArabic() => changeLocale(const Locale('ar'));
  void toEnglish() => changeLocale(const Locale('en'));

  bool get isArabic => state.languageCode == 'ar';
}
