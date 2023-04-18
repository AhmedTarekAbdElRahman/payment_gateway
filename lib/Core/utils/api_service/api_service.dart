import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);
  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await _dio.get(url, queryParameters: query,data: data);
  }

  Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token}) async {
    _dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
    };
    return await _dio.post(url, queryParameters: query, data: data);
  }
}
