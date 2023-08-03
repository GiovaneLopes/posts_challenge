import 'package:dartz/dartz.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/shared/platform/network_info.dart';
import 'package:posts_challenge/modules/home/domain/entities/post.dart';
import 'package:posts_challenge/modules/home/data/models/post_model.dart';
import 'package:posts_challenge/modules/home/data/errors/posts_errors.dart';
import 'package:posts_challenge/shared/datasources/users/users_datasource.dart';
import 'package:posts_challenge/modules/home/data/datasources/posts_datasource.dart';
import 'package:posts_challenge/modules/home/domain/repositories/post_repository.dart';

class PostRepositoryImp implements PostRepository {
  final PostsDatasource postDatasource;
  final UsersDatasource usersDatasource;
  final NetworkInfo networkInfo;

  PostRepositoryImp(this.postDatasource, this.usersDatasource, this.networkInfo);

  @override
  Future<Either<Failure, List<Post>>> call() async {
    try {
     if(await networkInfo.isConnected){
       List<PostModel> posts = await postDatasource();
      for (int i = 0; i < posts.length; i++) {
        final user = await usersDatasource(posts[i].userId);
        posts[i] = posts[i].copyWith(user: user);
      }
      return Right(posts);
     } else {
      return Left(NoInternetConnectionFailure());
     }
    } catch (e) {
      return Left(PostsServerError());
    }
  }
}
