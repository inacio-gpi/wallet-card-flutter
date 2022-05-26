import 'dart:convert';

import 'package:dio/dio.dart';

import 'i_dio_client.dart';

class DioClientImpl implements IDioClient {
  final Dio _dio;
  DioClientImpl(this._dio);

  @override
  Future<dynamic> request({
    required String path,
    String? method = "post",
    Map? body,
    Map? headers,
    bool injectUserToken = true,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

    final jsonBody = body != null ? jsonEncode(body) : null;
    late Response response;
    Future<Response>? futureResponse;
    try {
      if (method == 'post') {
        futureResponse = _dio.post(
          path,
          options: Options(
            headers: defaultHeaders,
            receiveTimeout: 10000,
          ),
          data: jsonBody,
        );
      } else if (method == 'get') {
      } else if (method == 'put') {}
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } catch (e) {
      // throw ApiErrorException();
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        if (response.data.isEmpty) {
          // throw WSApiErrorException(
          //   message: 'Não obtivemos retorno durante a requisição.',
          // );
          throw Exception();
        } else {
          return response.data;
        }
      default:
        throw Exception();
    }
  }
}
