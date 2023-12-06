import 'package:dw_barbershop/src/core/exceptions/auth_exceptions.dart';
import 'package:dw_barbershop/src/core/exceptions/repository_exceptions.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';

import '../../core/fp/nil.dart';
import '../../model/user_model.dart';

abstract interface class UserRepository {
  Future<Either<AuthExecption, String>> login(String email, String password);

  Future<Either<RepositoryExecption, UserModel>> me();

  Future<Either<RepositoryExecption, Nil>> registerAdmin(
    ({String name, String email, String password}) userData,
  );

  Future<Either<RepositoryExecption, List<UserModel>>> getEmployees(
      int barbershopId);

  Future<Either<RepositoryExecption, Nil>> registerAdmAsEmployee(
      ({
        List<String> workDays,
        List<int> workHours,
      }) userModel);

  Future<Either<RepositoryExecption, Nil>> registerEmployee(
      ({
        int barbershopId,
        String name,
        String email,
        String password,
        List<String> workDays,
        List<int> workHours,
      }) userModel);
}
