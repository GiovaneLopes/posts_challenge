import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../shared/datasources/users/users_datasource_test.mocks.dart';
import 'package:posts_challenge/modules/comments/data/models/comment_model.dart';
import 'package:posts_challenge/modules/comments/data/errors/comments_errors.dart';
import 'package:posts_challenge/modules/comments/data/datasources/comments_datasource.dart';

main() {
  final dio = MockDio();
  final datasource = CommentsDatasourceImp(dio);
  final data = [
    {
      "postId": 1,
      "id": 1,
      "name": "id labore ex et quam laborum",
      "email": "Eliseo@gardner.biz",
      "body":
          "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
    },
  ];
  test('Should return List<CommentModel>', () async {
    final httpResponse =
        Response(requestOptions: RequestOptions(), data: data, statusCode: 200);
    when(dio.get(any)).thenAnswer((realInvocation) async => httpResponse);
    final result = await datasource(1);
    expect(result, isInstanceOf<List<CommentModel>>());
  });

  test('Should return CommentServerError', () async {
    final httpResponse =
        Response(requestOptions: RequestOptions(), data: [], statusCode: 400);
    when(dio.get(any)).thenAnswer((realInvocation) async => httpResponse);
    expect(() => datasource(1), throwsA(isA<CommentServerError>()));
  });
}
