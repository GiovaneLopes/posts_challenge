import 'package:dartz/dartz.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/modules/home/domain/entities/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> call();
}
