import 'dart:convert';
import 'package:posts_challenge/modules/home/domain/entities/post.dart';
import 'package:posts_challenge/modules/home/domain/entities/user.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class PostModel extends Post {
  PostModel(
    super.user, {
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });

  PostModel copyWith({
    int? id,
    int? userId,
    User? user,
    String? title,
    String? body,
  }) {
    return PostModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user ?? this.user,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'user': user,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      null,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(id: $id, userId: $userId, user: $user, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.user == user &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        user.hashCode ^
        title.hashCode ^
        body.hashCode;
  }
}
