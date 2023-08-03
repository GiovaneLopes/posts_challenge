import 'package:posts_challenge/modules/home/domain/entities/user.dart';

class Post {
  int id;
  int userId;
  User? user;
  String title;
  String body;
  Post(this.user, {required this.id,required this.userId,required this.title,required this.body});
}
