import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'get_comments_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_challenge/modules/comments/domain/entities/comment.dart';
import 'package:posts_challenge/modules/comments/data/errors/comments_errors.dart';
import 'package:posts_challenge/modules/comments/domain/usecases/get_comments.dart';
import 'package:posts_challenge/modules/comments/domain/repositories/comment_repository.dart';

@GenerateNiceMocks([MockSpec<CommentRepository>()])
main() {
  final repository = MockCommentRepository();
  final usecase = GetCommentsUsecaseImp(repository);
  const postId = 0;

  test('Should return List<Comment>', () async {
    when(repository(postId)).thenAnswer(
      (_) async => const Right(<Comment>[]),
    );

    final result = await usecase(postId);
    expect(result.fold(id, id), isInstanceOf<List<Comment>>());
  });

  test('Should return CommentServerError', () async {
    when(repository(postId)).thenAnswer(
      (_) async => Left(CommentServerError()),
    );

    final result = await usecase(postId);
    expect(result.fold(id, id), isInstanceOf<CommentServerError>());
  });
}
