import 'package:dio/dio.dart';

import 'dio_interactor.dart';

class DioBase {
  static Dio get dio {
    final dio = Dio();

    dio.interceptors.add(LoggerInterceptor());
    return dio;
  }
}
