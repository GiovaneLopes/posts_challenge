import 'package:dartz/dartz.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/modules/home/domain/entities/post.dart';
import 'package:posts_challenge/modules/home/data/models/post_model.dart';
import 'package:posts_challenge/shared/datasources/users/users_datasource.dart';
import 'package:posts_challenge/modules/home/data/datasources/posts_datasource.dart';
import 'package:posts_challenge/modules/home/domain/repositories/post_repository.dart';

class PostRepositoryImp implements PostRepository {
  final PostsDatasource postDatasource;
  final UsersDatasource usersDatasource;

  PostRepositoryImp(this.postDatasource, this.usersDatasource);

  @override
  Future<Either<Failure, List<Post>>> call() async {
    try {
      List<PostModel> posts = await postDatasource();
      for (PostModel post in posts) {
        final user = await usersDatasource(post.userId);
        post.copyWith(user: user);
      }
      return Right(posts);
    } catch (e) {
      rethrow;
    }
  }
}
