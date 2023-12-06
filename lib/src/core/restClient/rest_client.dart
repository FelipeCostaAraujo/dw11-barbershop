import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dw_barbershop/src/core/restClient/interceptors/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(BaseOptions(
          baseUrl: 'http://localhost:8080',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
        )) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor(),
      PrettyDioLogger(),
    ]);
  }

  RestClient get auth => this..options.extra['DIO_AUTH_KEY'] = true;
  RestClient get unAuth => this..options.extra['DIO_AUTH_KEY'] = false;
}
