import '../domain/entities/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/modules/home/domain/usecases/get_posts.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPostsUsecase usecase;
  HomeCubit(this.usecase) : super(HomeLoadingState());

  Future<void> initialize() async {
    final response = await usecase();
    response.fold((failure) => emit(HomeErrorState(failure)),
        (list) => emit(HomeSuccessState(list)));
  }
}

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Post> posts;

  HomeSuccessState(this.posts);
}

class HomeErrorState extends HomeState {
  final Failure failure;

  HomeErrorState(this.failure);
}
