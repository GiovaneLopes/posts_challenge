import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_challenge/modules/home/data/models/post_model.dart';
import '../../../../shared/datasources/users/users_datasource_test.mocks.dart';
import 'package:posts_challenge/modules/home/data/datasources/posts_datasource.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
main() {
  final dio = MockDio();
  final datasource = PostsDatasourceImp(dio);

  test('Should return List<UserModel>', () async {
    final data = [
      {
        "userId": 1,
        "id": 1,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      }
    ];
    final httpResponse = Response(requestOptions: RequestOptions(), data: data);
    when(dio.get(any)).thenAnswer((realInvocation) async => httpResponse);
    final result = await datasource();
    expect(result, isInstanceOf<List<PostModel>>());
  });
}
