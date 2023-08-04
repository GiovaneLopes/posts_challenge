import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'users_datasource_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_challenge/shared/datasources/users/users_datasource.dart';
import 'package:posts_challenge/shared/datasources/users/errors/users_errors.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
main() {
  final dio = MockDio();
  late UsersDatasource userDatasource;
  final data = [
    {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
    }
  ];

  setUp(() {
    userDatasource = UsersDatasourceImp(dio);
  });

  test('Should return List<UserModel>', () async {
    final httpResponse =
        Response(requestOptions: RequestOptions(), data: data, statusCode: 200);
    when(dio.get(any)).thenAnswer((realInvocation) async => httpResponse);
    final result = await userDatasource(1);
    expect(result.userName, equals('Bret'));
  });

  test('Should return UserServerError', () async {
    final httpResponse =
        Response(requestOptions: RequestOptions(), data: [], statusCode: 400);
    when(dio.get(any)).thenAnswer((realInvocation) async => httpResponse);
    expect(() => userDatasource(1), throwsA(isA<UserServerError>()));
  });
}
