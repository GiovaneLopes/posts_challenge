import 'package:dio/dio.dart';
import 'package:posts_challenge/modules/home/data/models/user_model.dart';
import 'package:posts_challenge/shared/datasources/users/errors/users_errors.dart';
import 'package:posts_challenge/shared/datasources/users/constants/users_constants.dart';

abstract class UsersDatasource {
  Future<UserModel> call(int userId);
}

class UsersDatasourceImp implements UsersDatasource {
  final Dio _dio;

  UsersDatasourceImp(this._dio);

  List<UserModel> cachedUsers = <UserModel>[];

  Future<void> _getUsers() async {
    try {
      final response = await _dio.get<List>(UsersConstants.users);
      if (response.data != null && response.statusCode == 200) {
        cachedUsers =
            response.data!.map((user) => UserModel.fromMap(user)).toList();
      } else {
        throw UserServerError();
      }
    } catch (e) {
      throw UserServerError();
    }
  }

  @override
  Future<UserModel> call(int userId) async {
    try {
      if (cachedUsers.isEmpty) {
        await _getUsers();
        return cachedUsers.firstWhere((element) => element.id == userId);
      } else {
        return cachedUsers.firstWhere((element) => element.id == userId);
      }
    } catch (e) {
      throw UserServerError();
    }
  }
}
