import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posts_challenge/shared/platform/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_challenge/modules/comments/presentation/comments_page.dart';
import 'package:posts_challenge/modules/comments/presentation/comments_cubit.dart';
import 'package:posts_challenge/modules/comments/domain/usecases/get_comments.dart';
import 'package:posts_challenge/modules/comments/data/datasources/comments_datasource.dart';
import 'package:posts_challenge/modules/comments/data/repositories/comments_repository_imp.dart';

class CommentsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => InternetConnectionChecker()),
        Bind.lazySingleton((i) => NetworkInfoImp(i())),
        Bind.lazySingleton((i) => CommentsDatasourceImp(i())),
        Bind.lazySingleton((i) => CommentRepositoryImp(i(), i())),
        Bind.lazySingleton((i) => GetCommentsUsecaseImp(i())),
        Bind.lazySingleton((i) => CommentsCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => CommentsPage(post: args.data)),
      ];
}
