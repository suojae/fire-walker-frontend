import 'package:dio/dio.dart';

final class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.sesacyujin.site:3000',
      // baseUrl: 'http://172.17.0.2:3100',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // POST
  Future<Response> post(String path,
      {Map<String, dynamic>? data, Options? options}) async {
    return await _dio.post(path, data: data, options: options);
  }

  // GET
  Future<Response> get(String path,
      {Map<String, dynamic>? params, Options? options}) async {
    return await _dio.get(path, queryParameters: params, options: options);
  }

  // PUT
  Future<Response> put(String path,
      {Map<String, dynamic>? data, Options? options}) async {
    return await _dio.put(path, data: data, options: options);
  }

  // DELETE
  Future<Response> delete(String path,
      {Map<String, dynamic>? data, Options? options}) async {
    return await _dio.delete(path, data: data, options: options);
  }

  // PATCH
  Future<Response> patch(String path,
      {Map<String, dynamic>? data, Options? options}) async {
    return await _dio.patch(path, data: data, options: options);
  }
}
