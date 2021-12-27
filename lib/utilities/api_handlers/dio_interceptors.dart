import 'package:dio/dio.dart';

class DioInterceptors implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.message);
     handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("${options.method} ${options.path}");
     handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print(response.data.toString());
    handler.next(response);
  }
}
