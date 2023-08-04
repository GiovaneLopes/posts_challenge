import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:posts_challenge/modules/comments/domain/entities/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  final Function()? onTap;
  final bool? isPost;
  const CommentCard(
      {super.key, required this.comment, this.onTap, this.isPost = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 56,
                child: Column(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle),
                      child: Icon(
                        FeatherIcons.messageSquare,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          comment.body,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 10),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          if (isPost!) const Divider()
        ],
      ),
    );
  }
}
