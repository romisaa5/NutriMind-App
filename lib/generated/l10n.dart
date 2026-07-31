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

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Tips`
  String get tips {
    return Intl.message('Tips', name: 'tips', desc: '', args: []);
  }

  /// `Scan`
  String get scan {
    return Intl.message('Scan', name: 'scan', desc: '', args: []);
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Good morning`
  String get goodMorning {
    return Intl.message(
      'Good morning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `A new day, a new step towards your health`
  String get newDayNewStep {
    return Intl.message(
      'A new day, a new step towards your health',
      name: 'newDayNewStep',
      desc: '',
      args: [],
    );
  }

  /// `Today's Meals`
  String get todayMeals {
    return Intl.message(
      'Today\'s Meals',
      name: 'todayMeals',
      desc: '',
      args: [],
    );
  }

  /// `No meal logged yet`
  String get noMealLogged {
    return Intl.message(
      'No meal logged yet',
      name: 'noMealLogged',
      desc: '',
      args: [],
    );
  }

  /// `Today's Nutrition Summary`
  String get todayNutritionSummary {
    return Intl.message(
      'Today\'s Nutrition Summary',
      name: 'todayNutritionSummary',
      desc: '',
      args: [],
    );
  }

  /// `kcal`
  String get caloriesUnit {
    return Intl.message('kcal', name: 'caloriesUnit', desc: '', args: []);
  }

  /// `{remaining} kcal remaining to reach your goal`
  String remainingCaloriesMessage(int remaining) {
    return Intl.message(
      '$remaining kcal remaining to reach your goal',
      name: 'remainingCaloriesMessage',
      desc: '',
      args: [remaining],
    );
  }

  /// `Weekly Overview`
  String get weeklyOverview {
    return Intl.message(
      'Weekly Overview',
      name: 'weeklyOverview',
      desc: '',
      args: [],
    );
  }

  /// `Last 7 days`
  String get last7Days {
    return Intl.message('Last 7 days', name: 'last7Days', desc: '', args: []);
  }

  /// `{value} kcal`
  String caloriesTooltip(int value) {
    return Intl.message(
      '$value kcal',
      name: 'caloriesTooltip',
      desc: '',
      args: [value],
    );
  }

  /// `Sat`
  String get daySaturdayShort {
    return Intl.message('Sat', name: 'daySaturdayShort', desc: '', args: []);
  }

  /// `Sun`
  String get daySundayShort {
    return Intl.message('Sun', name: 'daySundayShort', desc: '', args: []);
  }

  /// `Mon`
  String get dayMondayShort {
    return Intl.message('Mon', name: 'dayMondayShort', desc: '', args: []);
  }

  /// `Tue`
  String get dayTuesdayShort {
    return Intl.message('Tue', name: 'dayTuesdayShort', desc: '', args: []);
  }

  /// `Wed`
  String get dayWednesdayShort {
    return Intl.message('Wed', name: 'dayWednesdayShort', desc: '', args: []);
  }

  /// `Thu`
  String get dayThursdayShort {
    return Intl.message('Thu', name: 'dayThursdayShort', desc: '', args: []);
  }

  /// `Fri`
  String get dayFridayShort {
    return Intl.message('Fri', name: 'dayFridayShort', desc: '', args: []);
  }

  /// `Breakfast`
  String get mealBreakfast {
    return Intl.message('Breakfast', name: 'mealBreakfast', desc: '', args: []);
  }

  /// `Lunch`
  String get mealLunch {
    return Intl.message('Lunch', name: 'mealLunch', desc: '', args: []);
  }

  /// `Dinner`
  String get mealDinner {
    return Intl.message('Dinner', name: 'mealDinner', desc: '', args: []);
  }

  /// `Drink enough water`
  String get drinkEnoughWater {
    return Intl.message(
      'Drink enough water',
      name: 'drinkEnoughWater',
      desc: '',
      args: [],
    );
  }

  /// `Try to drink 8 cups of water daily. It improves your mood and energy.`
  String get drinkEnoughWaterDesc {
    return Intl.message(
      'Try to drink 8 cups of water daily. It improves your mood and energy.',
      name: 'drinkEnoughWaterDesc',
      desc: '',
      args: [],
    );
  }

  /// `Don't compare yourself`
  String get dontCompareYourself {
    return Intl.message(
      'Don\'t compare yourself',
      name: 'dontCompareYourself',
      desc: '',
      args: [],
    );
  }

  /// `Everyone's journey is different. Focus on your progress.`
  String get dontCompareYourselfDesc {
    return Intl.message(
      'Everyone\'s journey is different. Focus on your progress.',
      name: 'dontCompareYourselfDesc',
      desc: '',
      args: [],
    );
  }

  /// `20 minutes daily walk`
  String get dailyWalk {
    return Intl.message(
      '20 minutes daily walk',
      name: 'dailyWalk',
      desc: '',
      args: [],
    );
  }

  /// `A simple walk after meals helps digestion and improves your mood.`
  String get dailyWalkDesc {
    return Intl.message(
      'A simple walk after meals helps digestion and improves your mood.',
      name: 'dailyWalkDesc',
      desc: '',
      args: [],
    );
  }

  /// `Sleep is as important as food`
  String get sleepIsImportant {
    return Intl.message(
      'Sleep is as important as food',
      name: 'sleepIsImportant',
      desc: '',
      args: [],
    );
  }

  /// `Lack of sleep affects hunger and fullness hormones.`
  String get sleepIsImportantDesc {
    return Intl.message(
      'Lack of sleep affects hunger and fullness hormones.',
      name: 'sleepIsImportantDesc',
      desc: '',
      args: [],
    );
  }

  /// `Spread protein across meals`
  String get spreadProtein {
    return Intl.message(
      'Spread protein across meals',
      name: 'spreadProtein',
      desc: '',
      args: [],
    );
  }

  /// `Distribute protein throughout the day for better benefits.`
  String get spreadProteinDesc {
    return Intl.message(
      'Distribute protein throughout the day for better benefits.',
      name: 'spreadProteinDesc',
      desc: '',
      args: [],
    );
  }

  /// `Nutrition`
  String get nutritionCategory {
    return Intl.message(
      'Nutrition',
      name: 'nutritionCategory',
      desc: '',
      args: [],
    );
  }

  /// `Mental Health`
  String get mentalCategory {
    return Intl.message(
      'Mental Health',
      name: 'mentalCategory',
      desc: '',
      args: [],
    );
  }

  /// `Fitness`
  String get sportCategory {
    return Intl.message('Fitness', name: 'sportCategory', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Tips for You`
  String get tipsTitle {
    return Intl.message('Tips for You', name: 'tipsTitle', desc: '', args: []);
  }

  /// `Simple things that make a difference every day`
  String get tipsSubtitle {
    return Intl.message(
      'Simple things that make a difference every day',
      name: 'tipsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Meal Scan`
  String get scanTitle {
    return Intl.message('Meal Scan', name: 'scanTitle', desc: '', args: []);
  }

  /// `Point the camera at your meal`
  String get scanIdleHint {
    return Intl.message(
      'Point the camera at your meal',
      name: 'scanIdleHint',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo of your meal and we'll\ncalculate calories, protein, and carbs automatically`
  String get scanIdleDescription {
    return Intl.message(
      'Take a photo of your meal and we\'ll\ncalculate calories, protein, and carbs automatically',
      name: 'scanIdleDescription',
      desc: '',
      args: [],
    );
  }

  /// `Analyzing with AI`
  String get scanAiBadge {
    return Intl.message(
      'Analyzing with AI',
      name: 'scanAiBadge',
      desc: '',
      args: [],
    );
  }

  /// `Analyzing your meal`
  String get scanAnalyzingTitle {
    return Intl.message(
      'Analyzing your meal',
      name: 'scanAnalyzingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sending the photo to AI to get its nutritional values`
  String get scanAnalyzingSubtitle {
    return Intl.message(
      'Sending the photo to AI to get its nutritional values',
      name: 'scanAnalyzingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Grilled chicken breast with rice and salad`
  String get scanResultMealName {
    return Intl.message(
      'Grilled chicken breast with rice and salad',
      name: 'scanResultMealName',
      desc: '',
      args: [],
    );
  }

  /// `Approximate estimate based on the photo`
  String get scanResultEstimateNote {
    return Intl.message(
      'Approximate estimate based on the photo',
      name: 'scanResultEstimateNote',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get scanCaloriesLabel {
    return Intl.message(
      'Calories',
      name: 'scanCaloriesLabel',
      desc: '',
      args: [],
    );
  }

  /// `{value} cal`
  String scanCaloriesValue(int value) {
    return Intl.message(
      '$value cal',
      name: 'scanCaloriesValue',
      desc: '',
      args: [value],
    );
  }

  /// `Protein`
  String get scanProteinLabel {
    return Intl.message(
      'Protein',
      name: 'scanProteinLabel',
      desc: '',
      args: [],
    );
  }

  /// `Carbs`
  String get scanCarbsLabel {
    return Intl.message('Carbs', name: 'scanCarbsLabel', desc: '', args: []);
  }

  /// `Fat`
  String get scanFatLabel {
    return Intl.message('Fat', name: 'scanFatLabel', desc: '', args: []);
  }

  /// `{value}g`
  String scanGramValue(int value) {
    return Intl.message(
      '${value}g',
      name: 'scanGramValue',
      desc: '',
      args: [value],
    );
  }

  /// `Retry`
  String get scanRetryButton {
    return Intl.message('Retry', name: 'scanRetryButton', desc: '', args: []);
  }

  /// `Save Meal`
  String get scanSaveButton {
    return Intl.message(
      'Save Meal',
      name: 'scanSaveButton',
      desc: '',
      args: [],
    );
  }

  /// `Health Assistant`
  String get chatbotAppBarTitle {
    return Intl.message(
      'Health Assistant',
      name: 'chatbotAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Online now`
  String get chatbotOnlineStatus {
    return Intl.message(
      'Online now',
      name: 'chatbotOnlineStatus',
      desc: '',
      args: [],
    );
  }

  /// `Hi 🌱 I'm here to help with any question about your food or how you're feeling today. Ask me anything.`
  String get chatbotWelcomeMessage {
    return Intl.message(
      'Hi 🌱 I\'m here to help with any question about your food or how you\'re feeling today. Ask me anything.',
      name: 'chatbotWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for sharing that. Remember every body is different, and today's effort is enough. Want to talk more about how you're feeling?`
  String get chatbotSampleReply {
    return Intl.message(
      'Thanks for sharing that. Remember every body is different, and today\'s effort is enough. Want to talk more about how you\'re feeling?',
      name: 'chatbotSampleReply',
      desc: '',
      args: [],
    );
  }

  /// `I overate today`
  String get chatbotSuggestionOverate {
    return Intl.message(
      'I overate today',
      name: 'chatbotSuggestionOverate',
      desc: '',
      args: [],
    );
  }

  /// `Healthy meal ideas`
  String get chatbotSuggestionHealthyMeal {
    return Intl.message(
      'Healthy meal ideas',
      name: 'chatbotSuggestionHealthyMeal',
      desc: '',
      args: [],
    );
  }

  /// `Feeling anxious about food`
  String get chatbotSuggestionAnxiety {
    return Intl.message(
      'Feeling anxious about food',
      name: 'chatbotSuggestionAnxiety',
      desc: '',
      args: [],
    );
  }

  /// `Type your question here...`
  String get chatbotInputHint {
    return Intl.message(
      'Type your question here...',
      name: 'chatbotInputHint',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message('Profile', name: 'profileTitle', desc: '', args: []);
  }

  /// `Edit Profile`
  String get profileEditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'profileEditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get profileSettingsSection {
    return Intl.message(
      'Settings',
      name: 'profileSettingsSection',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get profileLanguageTitle {
    return Intl.message(
      'Language',
      name: 'profileLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose the app language`
  String get profileLanguageSubtitle {
    return Intl.message(
      'Choose the app language',
      name: 'profileLanguageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get profileNotificationsTitle {
    return Intl.message(
      'Notifications',
      name: 'profileNotificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `About the app`
  String get profileAboutTitle {
    return Intl.message(
      'About the app',
      name: 'profileAboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get profileLogoutTitle {
    return Intl.message(
      'Log out',
      name: 'profileLogoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get profileThemeTitle {
    return Intl.message(
      'Appearance',
      name: 'profileThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose the app theme`
  String get profileThemeSubtitle {
    return Intl.message(
      'Choose the app theme',
      name: 'profileThemeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get profileThemeLight {
    return Intl.message('Light', name: 'profileThemeLight', desc: '', args: []);
  }

  /// `Dark`
  String get profileThemeDark {
    return Intl.message('Dark', name: 'profileThemeDark', desc: '', args: []);
  }

  /// `System`
  String get profileThemeSystem {
    return Intl.message(
      'System',
      name: 'profileThemeSystem',
      desc: '',
      args: [],
    );
  }

  /// `Eat more vegetables`
  String get eatMoreVeggies {
    return Intl.message(
      'Eat more vegetables',
      name: 'eatMoreVeggies',
      desc: '',
      args: [],
    );
  }

  /// `Aim to fill half your plate with vegetables at each meal for more fiber and nutrients.`
  String get eatMoreVeggiesDesc {
    return Intl.message(
      'Aim to fill half your plate with vegetables at each meal for more fiber and nutrients.',
      name: 'eatMoreVeggiesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Limit added sugar`
  String get limitAddedSugar {
    return Intl.message(
      'Limit added sugar',
      name: 'limitAddedSugar',
      desc: '',
      args: [],
    );
  }

  /// `Cutting back on sugary drinks and snacks helps keep your energy steady all day.`
  String get limitAddedSugarDesc {
    return Intl.message(
      'Cutting back on sugary drinks and snacks helps keep your energy steady all day.',
      name: 'limitAddedSugarDesc',
      desc: '',
      args: [],
    );
  }

  /// `Practice gratitude`
  String get practiceGratitude {
    return Intl.message(
      'Practice gratitude',
      name: 'practiceGratitude',
      desc: '',
      args: [],
    );
  }

  /// `Writing down three things you're grateful for can boost your mood over time.`
  String get practiceGratitudeDesc {
    return Intl.message(
      'Writing down three things you\'re grateful for can boost your mood over time.',
      name: 'practiceGratitudeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Take short breaks`
  String get takeBreaks {
    return Intl.message(
      'Take short breaks',
      name: 'takeBreaks',
      desc: '',
      args: [],
    );
  }

  /// `A five-minute pause every hour helps you focus and lowers stress.`
  String get takeBreaksDesc {
    return Intl.message(
      'A five-minute pause every hour helps you focus and lowers stress.',
      name: 'takeBreaksDesc',
      desc: '',
      args: [],
    );
  }

  /// `Stretch daily`
  String get stretchDaily {
    return Intl.message(
      'Stretch daily',
      name: 'stretchDaily',
      desc: '',
      args: [],
    );
  }

  /// `A few minutes of stretching improves flexibility and reduces muscle tension.`
  String get stretchDailyDesc {
    return Intl.message(
      'A few minutes of stretching improves flexibility and reduces muscle tension.',
      name: 'stretchDailyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Add strength training`
  String get strengthTraining {
    return Intl.message(
      'Add strength training',
      name: 'strengthTraining',
      desc: '',
      args: [],
    );
  }

  /// `Two sessions a week help build muscle and support your metabolism.`
  String get strengthTrainingDesc {
    return Intl.message(
      'Two sessions a week help build muscle and support your metabolism.',
      name: 'strengthTrainingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Keep a consistent sleep schedule`
  String get consistentSleepSchedule {
    return Intl.message(
      'Keep a consistent sleep schedule',
      name: 'consistentSleepSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Sleeping and waking at the same time daily improves your sleep quality.`
  String get consistentSleepScheduleDesc {
    return Intl.message(
      'Sleeping and waking at the same time daily improves your sleep quality.',
      name: 'consistentSleepScheduleDesc',
      desc: '',
      args: [],
    );
  }

  /// `Avoid screens before bed`
  String get avoidScreensBeforeBed {
    return Intl.message(
      'Avoid screens before bed',
      name: 'avoidScreensBeforeBed',
      desc: '',
      args: [],
    );
  }

  /// `Put your phone away 30 minutes before sleeping to fall asleep faster.`
  String get avoidScreensBeforeBedDesc {
    return Intl.message(
      'Put your phone away 30 minutes before sleeping to fall asleep faster.',
      name: 'avoidScreensBeforeBedDesc',
      desc: '',
      args: [],
    );
  }

  /// `Track your meals`
  String get trackYourMeals {
    return Intl.message(
      'Track your meals',
      name: 'trackYourMeals',
      desc: '',
      args: [],
    );
  }

  /// `Logging what you eat builds awareness and makes healthy choices easier.`
  String get trackYourMealsDesc {
    return Intl.message(
      'Logging what you eat builds awareness and makes healthy choices easier.',
      name: 'trackYourMealsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Small steps count`
  String get smallStepsCount {
    return Intl.message(
      'Small steps count',
      name: 'smallStepsCount',
      desc: '',
      args: [],
    );
  }

  /// `Consistent small changes lead to lasting results more than drastic ones.`
  String get smallStepsCountDesc {
    return Intl.message(
      'Consistent small changes lead to lasting results more than drastic ones.',
      name: 'smallStepsCountDesc',
      desc: '',
      args: [],
    );
  }

  /// `Sleep`
  String get sleepCategory {
    return Intl.message('Sleep', name: 'sleepCategory', desc: '', args: []);
  }

  /// `Habits`
  String get habitsCategory {
    return Intl.message('Habits', name: 'habitsCategory', desc: '', args: []);
  }

  /// `No tips in this category yet`
  String get noTipsInCategory {
    return Intl.message(
      'No tips in this category yet',
      name: 'noTipsInCategory',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Verification email sent`
  String get verificationEmailSent {
    return Intl.message(
      'Verification email sent',
      name: 'verificationEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `Email verified successfully`
  String get emailVerified {
    return Intl.message(
      'Email verified successfully',
      name: 'emailVerified',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Email`
  String get verifyEmailHeader {
    return Intl.message(
      'Verify Your Email',
      name: 'verifyEmailHeader',
      desc: '',
      args: [],
    );
  }

  /// `A verification email has been sent to your email address. Please check your inbox and click the link to verify your email.`
  String get verifyEmailMessage {
    return Intl.message(
      'A verification email has been sent to your email address. Please check your inbox and click the link to verify your email.',
      name: 'verifyEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Resend Verification Email`
  String get resendVerificationEmail {
    return Intl.message(
      'Resend Verification Email',
      name: 'resendVerificationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get logoutConfirmTitle {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutConfirmTitle',
      desc: '',
      args: [],
    );
  }

  /// `You will need to log in again to access your account.`
  String get logoutConfirmMessage {
    return Intl.message(
      'You will need to log in again to access your account.',
      name: 'logoutConfirmMessage',
      desc: '',
      args: [],
    );
  }

  /// `Choose Meal Type`
  String get chooseMealTypeTitle {
    return Intl.message(
      'Choose Meal Type',
      name: 'chooseMealTypeTitle',
      desc: '',
      args: [],
    );
  }

  /// `So we can classify your meal correctly`
  String get chooseMealTypeSubtitle {
    return Intl.message(
      'So we can classify your meal correctly',
      name: 'chooseMealTypeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo of your meal and we'll calculate calories, protein and carbs automatically`
  String get scanCaptureHint {
    return Intl.message(
      'Take a photo of your meal and we\'ll calculate calories, protein and carbs automatically',
      name: 'scanCaptureHint',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get takePhoto {
    return Intl.message('Take Photo', name: 'takePhoto', desc: '', args: []);
  }

  /// `Choose from Gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Change Meal Type`
  String get changeMealType {
    return Intl.message(
      'Change Meal Type',
      name: 'changeMealType',
      desc: '',
      args: [],
    );
  }

  /// `Analyzing your meal...`
  String get analyzingMessage {
    return Intl.message(
      'Analyzing your meal...',
      name: 'analyzingMessage',
      desc: '',
      args: [],
    );
  }

  /// `A few seconds and you'll get the nutrition values`
  String get analyzingSubtitle {
    return Intl.message(
      'A few seconds and you\'ll get the nutrition values',
      name: 'analyzingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retryButton {
    return Intl.message('Retry', name: 'retryButton', desc: '', args: []);
  }

  /// `Save Meal`
  String get saveMealButton {
    return Intl.message(
      'Save Meal',
      name: 'saveMealButton',
      desc: '',
      args: [],
    );
  }

  /// `Saving...`
  String get savingButton {
    return Intl.message('Saving...', name: 'savingButton', desc: '', args: []);
  }

  /// `Meal saved successfully`
  String get mealSavedSuccess {
    return Intl.message(
      'Meal saved successfully',
      name: 'mealSavedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `You need to sign in first`
  String get mustBeLoggedIn {
    return Intl.message(
      'You need to sign in first',
      name: 'mustBeLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Approximate estimate based on the photo`
  String get approxEstimateNote {
    return Intl.message(
      'Approximate estimate based on the photo',
      name: 'approxEstimateNote',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use`
  String get errorEmailAlreadyInUse {
    return Intl.message(
      'This email is already in use',
      name: 'errorEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get errorInvalidEmail {
    return Intl.message(
      'Invalid email format',
      name: 'errorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak, try a stronger one`
  String get errorWeakPassword {
    return Intl.message(
      'Password is too weak, try a stronger one',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password`
  String get errorWrongCredentials {
    return Intl.message(
      'Incorrect email or password',
      name: 'errorWrongCredentials',
      desc: '',
      args: [],
    );
  }

  /// `This account has been disabled`
  String get errorUserDisabled {
    return Intl.message(
      'This account has been disabled',
      name: 'errorUserDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts, please try again later`
  String get errorTooManyRequests {
    return Intl.message(
      'Too many attempts, please try again later',
      name: 'errorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get errorNetwork {
    return Intl.message(
      'Please check your internet connection',
      name: 'errorNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Please sign in again before this action`
  String get errorRequiresRecentLogin {
    return Intl.message(
      'Please sign in again before this action',
      name: 'errorRequiresRecentLogin',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while signing out`
  String get errorLogoutFailed {
    return Intl.message(
      'An error occurred while signing out',
      name: 'errorLogoutFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send verification email`
  String get errorVerificationEmailFailed {
    return Intl.message(
      'Failed to send verification email',
      name: 'errorVerificationEmailFailed',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while deleting your account`
  String get errorDeleteAccountFailed {
    return Intl.message(
      'An error occurred while deleting your account',
      name: 'errorDeleteAccountFailed',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while saving data`
  String get errorFirestoreSave {
    return Intl.message(
      'An error occurred while saving data',
      name: 'errorFirestoreSave',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while adding data`
  String get errorFirestoreAdd {
    return Intl.message(
      'An error occurred while adding data',
      name: 'errorFirestoreAdd',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while updating data`
  String get errorFirestoreUpdate {
    return Intl.message(
      'An error occurred while updating data',
      name: 'errorFirestoreUpdate',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while deleting data`
  String get errorFirestoreDelete {
    return Intl.message(
      'An error occurred while deleting data',
      name: 'errorFirestoreDelete',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while fetching data`
  String get errorFirestoreFetch {
    return Intl.message(
      'An error occurred while fetching data',
      name: 'errorFirestoreFetch',
      desc: '',
      args: [],
    );
  }

  /// `The image isn't clear, please try again`
  String get errorEmptyImage {
    return Intl.message(
      'The image isn\'t clear, please try again',
      name: 'errorEmptyImage',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't analyze the photo, try a clearer one`
  String get errorEmptyAnalysisResponse {
    return Intl.message(
      'We couldn\'t analyze the photo, try a clearer one',
      name: 'errorEmptyAnalysisResponse',
      desc: '',
      args: [],
    );
  }

  /// `We got an unexpected response, please try again`
  String get errorInvalidAnalysisFormat {
    return Intl.message(
      'We got an unexpected response, please try again',
      name: 'errorInvalidAnalysisFormat',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while analyzing the photo`
  String get errorAnalysis {
    return Intl.message(
      'An error occurred while analyzing the photo',
      name: 'errorAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again`
  String get errorUnknown {
    return Intl.message(
      'Something went wrong, please try again',
      name: 'errorUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Fiber`
  String get fiber {
    return Intl.message('Fiber', name: 'fiber', desc: '', args: []);
  }

  /// `More Info`
  String get mealDetailsMoreInfo {
    return Intl.message(
      'More Info',
      name: 'mealDetailsMoreInfo',
      desc: '',
      args: [],
    );
  }

  /// `Sugar`
  String get sugar {
    return Intl.message('Sugar', name: 'sugar', desc: '', args: []);
  }

  /// `Sodium`
  String get sodium {
    return Intl.message('Sodium', name: 'sodium', desc: '', args: []);
  }

  /// `Advice`
  String get mealDetailsAdviceTitle {
    return Intl.message(
      'Advice',
      name: 'mealDetailsAdviceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong while contacting the assistant, please try again`
  String get errorChatRequestFailed {
    return Intl.message(
      'Something went wrong while contacting the assistant, please try again',
      name: 'errorChatRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't generate a reply right now, please try again`
  String get errorChatEmptyResponse {
    return Intl.message(
      'We couldn\'t generate a reply right now, please try again',
      name: 'errorChatEmptyResponse',
      desc: '',
      args: [],
    );
  }

  /// `User data not found, please log in again`
  String get errorUserDataNotFound {
    return Intl.message(
      'User data not found, please log in again',
      name: 'errorUserDataNotFound',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get aboutTitle {
    return Intl.message('About', name: 'aboutTitle', desc: '', args: []);
  }

  /// `Your daily companion for tracking food and mental wellbeing`
  String get appTagline {
    return Intl.message(
      'Your daily companion for tracking food and mental wellbeing',
      name: 'appTagline',
      desc: '',
      args: [],
    );
  }

  /// `NutriMind helps you track your daily meals effortlessly, get calories, protein, and carbs from a single photo, while caring for your mental wellbeing through daily tips and a smart assistant that understands you.`
  String get aboutDescription {
    return Intl.message(
      'NutriMind helps you track your daily meals effortlessly, get calories, protein, and carbs from a single photo, while caring for your mental wellbeing through daily tips and a smart assistant that understands you.',
      name: 'aboutDescription',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get aboutVersionLabel {
    return Intl.message(
      'Version',
      name: 'aboutVersionLabel',
      desc: '',
      args: [],
    );
  }

  /// `App Features`
  String get aboutFeaturesTitle {
    return Intl.message(
      'App Features',
      name: 'aboutFeaturesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Instantly scan and analyze your meal`
  String get aboutFeatureScan {
    return Intl.message(
      'Instantly scan and analyze your meal',
      name: 'aboutFeatureScan',
      desc: '',
      args: [],
    );
  }

  /// `Full history of your daily meals`
  String get aboutFeatureHistory {
    return Intl.message(
      'Full history of your daily meals',
      name: 'aboutFeatureHistory',
      desc: '',
      args: [],
    );
  }

  /// `Daily tips for a healthier life`
  String get aboutFeatureTips {
    return Intl.message(
      'Daily tips for a healthier life',
      name: 'aboutFeatureTips',
      desc: '',
      args: [],
    );
  }

  /// `Smart assistant that answers your questions`
  String get aboutFeatureChat {
    return Intl.message(
      'Smart assistant that answers your questions',
      name: 'aboutFeatureChat',
      desc: '',
      args: [],
    );
  }

  /// `Developed by`
  String get aboutDeveloperSectionTitle {
    return Intl.message(
      'Developed by',
      name: 'aboutDeveloperSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Romaissa Mohamed Fadel`
  String get developerName {
    return Intl.message(
      'Romaissa Mohamed Fadel',
      name: 'developerName',
      desc: '',
      args: [],
    );
  }

  /// `App Developer`
  String get aboutDeveloperRole {
    return Intl.message(
      'App Developer',
      name: 'aboutDeveloperRole',
      desc: '',
      args: [],
    );
  }

  /// `Made with love in Egypt`
  String get aboutFooterMadeWith {
    return Intl.message(
      'Made with love in Egypt',
      name: 'aboutFooterMadeWith',
      desc: '',
      args: [],
    );
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
