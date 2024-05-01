import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:jala_test/shared/constants/api_url.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHttp {
  final String _baseUrl;
  Dio _dio = Dio();

  DioHttp({
    String baseUrl = API_URL.BASE,
  }) : _baseUrl = baseUrl;

  Dio setup() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    )
      ..interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: MemCacheStore(),
            maxStale: const Duration(minutes: 5),
            policy: CachePolicy.refresh,
          ),
        ),
      )
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
      );
    _dio = dio;
    return _dio;
  }
}
