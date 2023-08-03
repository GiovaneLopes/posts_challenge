import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_challenge/shared/errors/failure.dart';
import 'package:posts_challenge/modules/comments/domain/entities/comment.dart';
import 'package:posts_challenge/modules/comments/domain/usecases/get_comments.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final GetCommentsUsecase usecase;
  CommentsCubit(this.usecase) : super(CommentsLoadingState());

  Future<void> initialize(int postId) async {
    final response = await usecase(postId);
    response.fold((failure) => emit(CommentsErrorState(failure)),
        (list) => emit(CommentsSuccessState(list)));
  }
}

abstract class CommentsState {}

class CommentsLoadingState extends CommentsState {}

class CommentsSuccessState extends CommentsState {
  final List<Comment> comments;

  CommentsSuccessState(this.comments);
}

class CommentsErrorState extends CommentsState {
  final Failure failure;

  CommentsErrorState(this.failure);
}
