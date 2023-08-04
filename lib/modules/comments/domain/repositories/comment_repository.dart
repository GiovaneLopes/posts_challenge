import 'package:dartz/dartz.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/modules/comments/domain/entities/comment.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<Comment>>> call(int postId);
}
