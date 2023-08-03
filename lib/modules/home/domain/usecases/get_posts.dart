import 'package:dartz/dartz.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/modules/home/domain/entities/post.dart';
import 'package:posts_challenge/modules/home/domain/repositories/post_repository.dart';

abstract class GetPostsUsecase {
  Future<Either<Failure, List<Post>>> call();
}

class GetPostsUsecaseImp implements GetPostsUsecase {
  final PostRepository repository;

  GetPostsUsecaseImp(this.repository);

  @override
  Future<Either<Failure, List<Post>>> call() async {
    return await repository();
  }
}
