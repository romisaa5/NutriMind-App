// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Please enter your email and password to login`
  String get loginMessage {
    return Intl.message(
      'Please enter your email and password to login',
      name: 'loginMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get signUpHeader {
    return Intl.message(
      'Create an Account',
      name: 'signUpHeader',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email and password to create an account`
  String get signUpMessage {
    return Intl.message(
      'Please enter your email and password to create an account',
      name: 'signUpMessage',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Forgot Password`
  String get forgotPasswordHeader {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordHeader',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to reset your password`
  String get forgotPasswordMessage {
    return Intl.message(
      'Please enter your email to reset your password',
      name: 'forgotPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Eat Smarter,`
  String get onboarding1_title_line1 {
    return Intl.message(
      'Eat Smarter,',
      name: 'onboarding1_title_line1',
      desc: '',
      args: [],
    );
  }

  /// `Live Better`
  String get onboarding1_title_line2 {
    return Intl.message(
      'Live Better',
      name: 'onboarding1_title_line2',
      desc: '',
      args: [],
    );
  }

  /// `NutriMind AI helps you make healthier food\nchoices every day with the power of AI.`
  String get onboarding1_description {
    return Intl.message(
      'NutriMind AI helps you make healthier food\nchoices every day with the power of AI.',
      name: 'onboarding1_description',
      desc: '',
      args: [],
    );
  }

  /// `Scan Food,`
  String get onboarding2_title_line1 {
    return Intl.message(
      'Scan Food,',
      name: 'onboarding2_title_line1',
      desc: '',
      args: [],
    );
  }

  /// `Know More`
  String get onboarding2_title_line2 {
    return Intl.message(
      'Know More',
      name: 'onboarding2_title_line2',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo of your meal and get instant\nnutrition analysis, calories, macros, and\nhealth score.`
  String get onboarding2_description {
    return Intl.message(
      'Take a photo of your meal and get instant\nnutrition analysis, calories, macros, and\nhealth score.',
      name: 'onboarding2_description',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get calories {
    return Intl.message('Calories', name: 'calories', desc: '', args: []);
  }

  /// `Protein`
  String get protein {
    return Intl.message('Protein', name: 'protein', desc: '', args: []);
  }

  /// `Carbs`
  String get carbs {
    return Intl.message('Carbs', name: 'carbs', desc: '', args: []);
  }

  /// `Fat`
  String get fat {
    return Intl.message('Fat', name: 'fat', desc: '', args: []);
  }

  /// `Your AI Nutrition`
  String get onboarding3_title_line1 {
    return Intl.message(
      'Your AI Nutrition',
      name: 'onboarding3_title_line1',
      desc: '',
      args: [],
    );
  }

  /// `Coach`
  String get onboarding3_title_line2 {
    return Intl.message(
      'Coach',
      name: 'onboarding3_title_line2',
      desc: '',
      args: [],
    );
  }

  /// `Ask anything about nutrition, get personalized\nadvice and build healthier habits with AI.`
  String get onboarding3_description {
    return Intl.message(
      'Ask anything about nutrition, get personalized\nadvice and build healthier habits with AI.',
      name: 'onboarding3_description',
      desc: '',
      args: [],
    );
  }

  /// `Hi there! 👋\nI'm your AI nutrition assistant.\nHow can I help you today?`
  String get chat_welcome {
    return Intl.message(
      'Hi there! 👋\nI\'m your AI nutrition assistant.\nHow can I help you today?',
      name: 'chat_welcome',
      desc: '',
      args: [],
    );
  }

  /// `What are some high\nprotein snacks?`
  String get chat_question {
    return Intl.message(
      'What are some high\nprotein snacks?',
      name: 'chat_question',
      desc: '',
      args: [],
    );
  }

  /// `Here are some healthy\nhigh-protein snack ideas:`
  String get chat_answer_intro {
    return Intl.message(
      'Here are some healthy\nhigh-protein snack ideas:',
      name: 'chat_answer_intro',
      desc: '',
      args: [],
    );
  }

  /// `Greek yogurt with nuts`
  String get snack_greek_yogurt {
    return Intl.message(
      'Greek yogurt with nuts',
      name: 'snack_greek_yogurt',
      desc: '',
      args: [],
    );
  }

  /// `Boiled eggs`
  String get snack_boiled_eggs {
    return Intl.message(
      'Boiled eggs',
      name: 'snack_boiled_eggs',
      desc: '',
      args: [],
    );
  }

  /// `Protein smoothie`
  String get snack_protein_smoothie {
    return Intl.message(
      'Protein smoothie',
      name: 'snack_protein_smoothie',
      desc: '',
      args: [],
    );
  }

  /// `Cottage cheese with fruits`
  String get snack_cottage_cheese {
    return Intl.message(
      'Cottage cheese with fruits',
      name: 'snack_cottage_cheese',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get get_started {
    return Intl.message('Get Started', name: 'get_started', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
