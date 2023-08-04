import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posts_challenge/shared/platform/network_info.dart';
import 'package:posts_challenge/modules/home/presentation/home_page.dart';
import 'package:posts_challenge/modules/home/presentation/home_cubit.dart';
import 'package:posts_challenge/modules/home/domain/usecases/get_posts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_challenge/shared/datasources/users/users_datasource.dart';
import 'package:posts_challenge/modules/comments/presentation/comments_module.dart';
import 'package:posts_challenge/modules/home/data/datasources/posts_datasource.dart';
import 'package:posts_challenge/modules/home/data/repositories/post_repository_imp.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => InternetConnectionChecker()),
        Bind.lazySingleton((i) => NetworkInfoImp(i())),
        Bind.lazySingleton((i) => PostsDatasourceImp(i())),
        Bind.lazySingleton((i) => UsersDatasourceImp(i())),
        Bind.lazySingleton((i) => PostRepositoryImp(i(), i(), i())),
        Bind.lazySingleton((i) => GetPostsUsecaseImp(i())),
        Bind.lazySingleton((i) => HomeCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/comments', module: CommentsModule()),
      ];
}
