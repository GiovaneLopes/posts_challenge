import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'posts_repository_imp_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_challenge/modules/home/data/models/user_model.dart';
import 'package:posts_challenge/modules/home/data/models/post_model.dart';
import 'package:posts_challenge/shared/datasources/users/users_datasource.dart';
import 'package:posts_challenge/modules/home/data/datasources/posts_datasource.dart';
import 'package:posts_challenge/modules/home/data/repositories/post_repository_imp.dart';

@GenerateNiceMocks([MockSpec<PostsDatasource>(), MockSpec<UsersDatasource>()])
main() {
  final postDatasource = MockPostsDatasource();
  final userDatasource = MockUsersDatasource();
  final repository = PostRepositoryImp(postDatasource, userDatasource);
  final userMock = UserModel(1, 'Pedro');

  test('Should return List<PostModel>', () async {

    when(postDatasource()).thenAnswer((realInvocation)async => <PostModel>[]);
    when(userDatasource(1)).thenAnswer((realInvocation)async => userMock);

    final postResult = await postDatasource();
    final userResult = await userDatasource(1);
    final result = await repository();
    expect(postResult, isA<List<PostModel>>());
    expect(userResult.userName, equals(userMock.userName));
    expect(result.fold(id, id), isA<List<PostModel>>());
  });
}
