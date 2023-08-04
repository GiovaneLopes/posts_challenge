import 'package:dio/dio.dart';
import 'package:posts_challenge/modules/comments/data/models/comment_model.dart';
import 'package:posts_challenge/modules/comments/data/errors/comments_errors.dart';
import 'package:posts_challenge/modules/comments/data/constants/comments_constants.dart';

abstract class CommentsDatasource {
  Future<List<CommentModel>> call(int postId);
}

class CommentsDatasourceImp implements CommentsDatasource {
  final Dio _dio;

  CommentsDatasourceImp(this._dio);

  @override
  Future<List<CommentModel>> call(int postId) async {
    try {
      final response = await _dio.get<List>(CommentConstants.comments(postId));
      if (response.data != null && response.statusCode == 200) {
        return response.data!
            .map((comment) => CommentModel.fromMap(comment))
            .toList();
      } else {
        throw CommentServerError();
      }
    } catch (e) {
      throw CommentServerError();
    }
  }
}
