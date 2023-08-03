import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:posts_challenge/modules/home/domain/entities/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

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
                      decoration:  BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle),
                      child: Icon(
                        FeatherIcons.alignJustify,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    AutoSizeText(
                      post.user?.userName ?? '-',
                      maxLines: 1,
                      minFontSize: 8,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          post.body,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 9),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Text('Comments'),
                                  Icon(
                                    FeatherIcons.arrowRight,
                                    size: 15,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
