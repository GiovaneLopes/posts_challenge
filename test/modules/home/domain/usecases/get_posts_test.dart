import 'package:dartz/dartz.dart';
import 'get_posts_test.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_challenge/modules/home/domain/entities/post.dart';
import 'package:posts_challenge/modules/home/domain/usecases/get_posts.dart';
import 'package:posts_challenge/modules/home/domain/repositories/post_repository.dart';

@GenerateNiceMocks([MockSpec<PostRepository>()])
main() {
  final repository = MockPostRepository();
  final usecase = GetPostsUsecaseImp(repository);

  test('Should return List<Post>', () async {
    when(repository())
        .thenAnswer((realInvocation) async => const Right(<Post>[]));

    final result = await usecase();
    expect(result.fold(id, id), isInstanceOf<List<Post>>());
  });
}
