import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posts_challenge/shared/ui/post_card.dart';
import 'package:posts_challenge/shared/resources/images.dart';
import 'package:posts_challenge/modules/home/domain/entities/post.dart';
import 'package:posts_challenge/modules/comments/presentation/comments_cubit.dart';
import 'package:posts_challenge/modules/comments/presentation/widgets/comment_card.dart';

class CommentsPage extends StatefulWidget {
  final Post post;
  const CommentsPage({super.key, required this.post});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final cubit = Modular.get<CommentsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.initialize(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Modular.to.pop(),
              icon: Icon(
                FeatherIcons.arrowLeft,
                color: Theme.of(context).colorScheme.surface,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Comments',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              PostCard(
                post: widget.post,
                isPost: false,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Comments',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 32,
              ),
              BlocConsumer(
                listener: (context, state) {
                  if (state.runtimeType == CommentsErrorState) {
                    final error = state as CommentsErrorState;
                    final snackBar = SnackBar(
                      content: Text(error.failure.errorMessage),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                bloc: cubit,
                builder: (context, state) {
                  if (state.runtimeType == CommentsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.runtimeType == CommentsErrorState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => cubit.initialize(widget.post.id),
                            icon: const Icon(Icons.update),
                          ),
                          const Text('Opps, something went wrong. Try again'),
                        ],
                      ),
                    );
                  }
                  final success = state as CommentsSuccessState;
                  if (success.comments.isNotEmpty) {
                    return Column(
                      children: success.comments
                          .map((comment) => CommentCard(comment: comment))
                          .toList(),
                    );
                  } else {
                    return Center(
                        child: Column(children: [
                      const SizedBox(height: 38),
                      Image.asset(Images.noData),
                      const SizedBox(height: 18),
                      Text(
                        'No Comments',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ]));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
