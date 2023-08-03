import 'package:dartz/dartz.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/modules/comments/domain/entities/comment.dart';
import 'package:posts_challenge/modules/comments/domain/repositories/comment_repository.dart';

abstract class GetCommentsUsecase {
  Future<Either<Failure, List<Comment>>> call(int postId);
}

class GetCommentsUsecaseImp implements GetCommentsUsecase {
  final CommentRepository repository;

  GetCommentsUsecaseImp(this.repository);

  @override
  Future<Either<Failure, List<Comment>>> call(int postId) async {
    return await repository(postId);
  }
}
