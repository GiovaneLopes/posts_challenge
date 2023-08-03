import 'package:posts_challenge/shared/errors/failure.dart';

class CommentServerError extends Failure {
  CommentServerError() : super(errorMessage: 'Server Error');
}
