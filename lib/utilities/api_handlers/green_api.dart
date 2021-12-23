import 'package:green_notes/models/api_response.dart';
import 'package:green_notes/utilities/api_handlers/api_utils.dart';
import 'package:green_notes/utilities/constants/app_strings.dart';

import 'api.dart';
import 'package:dio/dio.dart';
import 'dio_interceptors.dart';

class GreenApi implements Api {
  final Dio _dio = Dio();

  GreenApi() {
    _dio.interceptors.add(DioInterceptors());
    _dio.options.sendTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
    _dio.options.baseUrl = AppStrings().apiBaseUrl;
  }

  @override
  Future<ApiResponse?> get(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await _dio.get(path,
          queryParameters: data, options: Options(headers: headers));
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Future<ApiResponse?> post(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final res =
          await _dio.post(path, data: data, options: Options(headers: headers));
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      print(e);
      return ApiUtils.toApiResponse(e.response!);
    }
  }
}
