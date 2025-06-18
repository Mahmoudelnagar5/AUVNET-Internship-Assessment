import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

import '../../domain/entites/user_entity.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends UserEntity {
  @override
  @HiveField(0)
  final String name;

  @override
  @HiveField(1)
  final String email;

  @override
  @HiveField(2)
  final String uId;

  UserModel({
    required this.name,
    required this.email,
    required this.uId,
  }) : super(name: name, email: email, uId: uId);

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      uId: json['uId'] ?? '',
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}
