import 'dart:convert';
import 'package:posts_challenge/modules/home/domain/entities/user.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


class UserModel extends User {
  UserModel(
    super.id,
    super.userName,
  );

  UserModel copyWith({
    int? id,
    String? userName,
  }) {
    return UserModel(
      id ?? this.id,
      userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': userName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'] as int,
      map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(id: $id, userName: $userName)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.userName == userName;
  }

  @override
  int get hashCode => id.hashCode ^ userName.hashCode;
}
