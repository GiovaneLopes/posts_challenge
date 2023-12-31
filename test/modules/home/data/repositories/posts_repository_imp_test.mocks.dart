// Mocks generated by Mockito 5.4.2 from annotations
// in posts_challenge/test/modules/home/data/repositories/posts_repository_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:posts_challenge/modules/home/data/datasources/posts_datasource.dart'
    as _i3;
import 'package:posts_challenge/modules/home/data/models/post_model.dart'
    as _i5;
import 'package:posts_challenge/modules/home/data/models/user_model.dart'
    as _i2;
import 'package:posts_challenge/shared/datasources/users/users_datasource.dart'
    as _i6;
import 'package:posts_challenge/shared/platform/network_info.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserModel_0 extends _i1.SmartFake implements _i2.UserModel {
  _FakeUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PostsDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostsDatasource extends _i1.Mock implements _i3.PostsDatasource {
  @override
  _i4.Future<List<_i5.PostModel>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i4.Future<List<_i5.PostModel>>.value(<_i5.PostModel>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i5.PostModel>>.value(<_i5.PostModel>[]),
      ) as _i4.Future<List<_i5.PostModel>>);
}

/// A class which mocks [UsersDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsersDatasource extends _i1.Mock implements _i6.UsersDatasource {
  @override
  _i4.Future<_i2.UserModel> call(int? userId) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [userId],
        ),
        returnValue: _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #call,
            [userId],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #call,
            [userId],
          ),
        )),
      ) as _i4.Future<_i2.UserModel>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i7.NetworkInfo {
  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
