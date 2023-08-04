import 'package:posts_challenge/shared/errors/failure.dart';

class PostsServerError extends Failure {
  PostsServerError() : super(errorMessage: 'Erro de servidor');
}
