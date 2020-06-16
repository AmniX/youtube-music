import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';

class Network {
  static Dio _dio;

  static Dio getDio(String baseUrl) {
    if (Network._dio == null) {
      BaseOptions baseOptions = BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 10000,
          receiveTimeout: 10000,
          contentType: "application/json");
      Network._dio = Dio(baseOptions);
      Network._dio.interceptors.add(LogInterceptor(responseBody: true));
      Network._dio.transformer = FlutterTransformer();
    }

    return _dio;
  }
}
