import 'package:dio/dio.dart';
import 'package:posts_challenge/modules/home/data/models/post_model.dart';
import 'package:posts_challenge/modules/home/data/errors/posts_errors.dart';
import 'package:posts_challenge/modules/home/data/constants/home_constants.dart';

abstract class PostsDatasource {
  Future<List<PostModel>> call();
}

class PostsDatasourceImp implements PostsDatasource {
  final Dio _dio;

  PostsDatasourceImp(this._dio);

  @override
  Future<List<PostModel>> call() async {
    try {
      final response = await _dio.get<List>(HomeConstants.posts);
      if (response.data != null && response.statusCode == 200) {
        return response.data!.map((post) => PostModel.fromMap(post)).toList();
      } else {
        throw PostsServerError();
      }
    } catch (e) {
      throw PostsServerError();
    }
  }
}
