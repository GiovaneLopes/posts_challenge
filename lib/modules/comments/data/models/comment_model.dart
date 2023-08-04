import 'dart:convert';
import 'package:posts_challenge/modules/comments/domain/entities/comment.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


class CommentModel extends Comment {
  CommentModel({
    required super.id,
    required super.title,
    required super.body,
  });

  CommentModel copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return CommentModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': title,
      'body': body,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as int,
      title: map['name'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CommentModel(id: $id, title: $title, body: $body)';

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}
