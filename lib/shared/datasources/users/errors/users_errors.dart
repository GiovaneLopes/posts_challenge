import 'package:posts_challenge/shared/errors/failure.dart';

class UserServerError extends Failure {
  UserServerError() : super(errorMessage: 'Erro de servidor');
}
