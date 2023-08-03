import 'package:dartz/dartz.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/shared/platform/network_info.dart';
import 'package:posts_challenge/modules/comments/domain/entities/comment.dart';
import 'package:posts_challenge/modules/comments/data/errors/comments_errors.dart';
import 'package:posts_challenge/modules/comments/data/datasources/comments_datasource.dart';
import 'package:posts_challenge/modules/comments/domain/repositories/comment_repository.dart';

class CommentRepositoryImp implements CommentRepository {
  final CommentsDatasource datasource;
  final NetworkInfo networkInfo;

  CommentRepositoryImp(this.datasource, this.networkInfo);

  @override
  Future<Either<Failure, List<Comment>>> call(int postId) async {
    try {
      if (await networkInfo.isConnected) {
        final response = await datasource(postId);
        return Right(response);
      } else {
        return Left(NoInternetConnectionFailure());
      }
    } catch (e) {
      return Left(CommentServerError());
    }
  }
}
