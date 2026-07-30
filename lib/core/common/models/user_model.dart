class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? image;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"],
      name: json["name"],
      email: json["email"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"uid": uid, "name": name, "email": email, "image": image};
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? image,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }
}
