import 'dart:developer';
import 'dart:io';

import 'package:barber_shop/src/core/client/client.dart';
import 'package:barber_shop/src/core/exceptions/auth_exception.dart';
import 'package:barber_shop/src/core/fp/either.dart';
import 'package:barber_shop/src/repositories/user/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;
  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthException, String>> login(
    String email,
    String password,
  ) async {
    try {
      final Response(data: data) = await restClient.unAuth.post(
        '/auth',
        data: {
          'email': email,
          'password': password,
        },
      );
      return Success(data);
    } on DioException catch (e, s) {
      if (e.response != null) {
        if (e.response!.statusCode == HttpStatus.forbidden ||
            e.response!.statusCode == HttpStatus.unauthorized) {
          return Failure(
            AuthUnauthorized(message: e.response!.data['message']),
          );
        }
        log('Login ou senha invalidos', error: e, stackTrace: s);
        return Failure(
          AuthError(message: e.response!.data['message']),
        );
      }
      log('Erro ao realizer login', error: e, stackTrace: s);
      return Failure(
        AuthError(message: 'Erro ao realizar login'),
      );
    }
  }
}
