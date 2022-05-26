import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:palestine_console/palestine_console.dart';

class LoggerInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Print.red(
        "<-- ${err.message} ${(err.requestOptions.baseUrl + err.requestOptions.path)}",
        name: 'Error');
    Print.red(
        "${err.response != null ? err.response!.data : 'Erro Desconhecido'}",
        name: 'Error');
    Print.red("<-- End error", name: 'Error');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Print.magenta(
        "--> ${options.method.toUpperCase()}: ${(options.baseUrl) + (options.path)}",
        name: 'Request');
    Print.magenta("Headers:", name: 'Request');
    options.headers.forEach((k, v) => Print.magenta('$k: $v', name: 'Request'));
    Print.magenta("queryParameters:", name: 'Request');
    options.queryParameters
        .forEach((k, v) => Print.magenta('$k: $v', name: 'Request'));
    if (options.data != null) {
      Print.magenta("Body: ${jsonEncode(options.data)}", name: 'Request');
    }
    Print.magenta(
        "--> END ${options.method.toUpperCase()}: ${(options.baseUrl) + (options.path)}",
        name: 'Request');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Print.green(
        "<-- ${response.statusCode} ${(response.requestOptions.baseUrl + response.requestOptions.path)}",
        name: 'Response');
    Print.green("Hashcode:", name: 'Response');
    Print.green(response.hashCode.toString(), name: 'Response');
    Print.green("Headers:", name: 'Response');

    response.headers.forEach((k, v) => Print.green('$k: $v', name: 'Response'));
    Print.green(jsonEncode(response.data), name: 'Response');
    Print.green("<-- END HTTP", name: 'Response');
    handler.next(response);
  }
}
