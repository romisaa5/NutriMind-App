class FirestoreCollections {
  const FirestoreCollections._();
  static const String users = 'users';
  static String userMeals(String uid) => '$users/$uid/meals';
  static String userChats(String uid) => '$users/$uid/chats';
  static String userWeeklyStats(String uid) => '$users/$uid/weekly_stats';
}
