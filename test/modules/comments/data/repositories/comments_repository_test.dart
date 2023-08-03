import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'comments_repository_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/shared/platform/network_info.dart';
import 'package:posts_challenge/modules/comments/data/models/comment_model.dart';
import 'package:posts_challenge/modules/comments/data/datasources/comments_datasource.dart';
import 'package:posts_challenge/modules/comments/data/repositories/comments_repository_imp.dart';

@GenerateNiceMocks([MockSpec<CommentsDatasource>(), MockSpec<NetworkInfo>()])
main() {
  final networkInfo = MockNetworkInfo();
  final datasource = MockCommentsDatasource();
  final repository = CommentRepositoryImp(datasource, networkInfo);
  const postId = 0;

  test('Should return List<Comment>', () async {
    when(datasource(postId))
        .thenAnswer((realInvocation) async => <CommentModel>[]);
    when(networkInfo.isConnected).thenAnswer((realInvocation) async => true);
    final result = await repository(postId);
    expect(result.fold(id, id), isInstanceOf<List<CommentModel>>());
  });

  test('Should return NoInternetConnectionFailure', () async {
    when(datasource(postId))
        .thenAnswer((realInvocation) async => <CommentModel>[]);
    when(networkInfo.isConnected).thenAnswer((realInvocation) async => false);
    final result = await repository(postId);
    expect(result.fold(id, id), isInstanceOf<NoInternetConnectionFailure>());
  });
}
