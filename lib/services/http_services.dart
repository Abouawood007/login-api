import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpService {
  Dio? _dio;

  final baseUrl = "https://reqres.in/";

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;

    try {
      response = await _dio!.get(endPoint);
      print(response.data);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio!.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        if (kDebugMode) {
          print(e);
        }
      },
      onRequest: (options, handler) {
        if (kDebugMode) {
          print("${options.method} ${options.path}");
        }
      },
      onResponse: (e, handler) {
        if (kDebugMode) {
          print(e.data);
        }
      },
    ));
  }
}