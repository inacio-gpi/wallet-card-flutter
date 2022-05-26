abstract class IDioClient {
  Future<dynamic> request({
    required String path,
    String? method,
    Map? body,
    Map? headers,
  });
}
