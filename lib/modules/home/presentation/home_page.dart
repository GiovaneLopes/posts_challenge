import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posts_challenge/shared/ui/post_card.dart';
import 'package:posts_challenge/modules/home/presentation/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = Modular.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Icon(
              FeatherIcons.bookOpen,
              color: Theme.of(context).colorScheme.surface,
              size: 24,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Posts',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
      body: BlocConsumer(
        listener: (context, state) {
          if (state.runtimeType == HomeErrorState) {
            final error = state as HomeErrorState;
            final snackBar = SnackBar(
              content: Text(error.failure.errorMessage),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        bloc: cubit,
        builder: (context, state) {
          if (state.runtimeType == HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.runtimeType == HomeErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => cubit.initialize(),
                    icon: const Icon(Icons.update),
                  ),
                  const Text('Opps, something went wrong. Try again'),
                ],
              ),
            );
          }
          final success = state as HomeSuccessState;
          return Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    children: success.posts.map((post) {
                      return PostCard(post: post);
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
