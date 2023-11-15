import 'package:dio/dio.dart';

class DioFactory {
  // Create a Dio instance with default configurations
  Dio instance() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://cricbuzz-cricket.p.rapidapi.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        "X-RapidAPI-Key": "",
        "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com"
      }
    );
    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true, request: true));
    return dio;
  }
}
