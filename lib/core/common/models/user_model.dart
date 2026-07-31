import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String? name;
  final DateTime? createdAt;

  const UserModel({
    required this.uid,
    required this.email,
    this.name,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String id) {
    return UserModel(
      uid: id,
      email: json['email'] as String? ?? '',
      name: json['name'] as String?,
      createdAt: (json['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
