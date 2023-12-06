import 'package:dw_barbershop/src/core/exceptions/repository_exceptions.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';
import 'package:dw_barbershop/src/model/schedule_model.dart';

abstract interface class ScheduleRepository {
  Future<Either<RepositoryExecption, Nil>> scheduleClient(
      ({
        int barbershopId,
        int userId,
        String clientName,
        DateTime date,
        int time
      }) scheduleData);

  Future<Either<RepositoryExecption, List<ScheduleModel>>> findScheduleByDate(
      ({
        DateTime date,
        int userId,
      }) filter);
}
