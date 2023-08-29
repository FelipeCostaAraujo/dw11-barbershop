import 'package:barber_shop/src/core/constants/local_storage_keys.dart';
import 'package:barber_shop/src/core/exceptions/service_exception.dart';
import 'package:barber_shop/src/core/fp/either.dart';
import 'package:barber_shop/src/core/fp/nil.dart';
import 'package:barber_shop/src/repositories/user/user_repository.dart';
import 'package:barber_shop/src/services/user_login/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/exceptions/auth_exception.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository userRepository;

  UserLoginServiceImpl({required this.userRepository});

  @override
  Future<Either<ServiceException, Nil>> execute(
      String username, String password) async {
    final loginResult = await userRepository.login(username, password);

    switch (loginResult) {
      case Success(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageKeys.accessToken, accessToken);
        return Success(nil);
      case Failure(:final exception):
        switch (exception) {
          case AuthError():
            return Failure(ServiceException(message: "Erro ao realizer login"));
          case AuthUnauthorized():
            return Failure(
              ServiceException(message: "Login ou senha inválidos"),
            );
        }
    }
  }
}
