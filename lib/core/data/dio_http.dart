import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pexels_image/shared/constants/api_url.dart';
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
          requestHeader: false,
          requestBody: false,
          responseBody: false,
          responseHeader: true,
          error: true,
          compact: true,
        ),
      );
    _dio = dio;
    return _dio;
  }

  Dio setupWithToken() {
    final Dio dio = setup();
    dio.options.headers['Authorization'] =
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImZiMzMxZmZhMzkxY2FjNWZmNDJhNjNlZWU3MjQzODQwY2RhNzIwYTc1ZDIwMzA3ZTU0MThiYjQ5ZDBjYmMyMGE5N2U3YTI5MjFhYmMyYTllIn0.eyJhdWQiOiIxIiwianRpIjoiZmIzMzFmZmEzOTFjYWM1ZmY0MmE2M2VlZTcyNDM4NDBjZGE3MjBhNzVkMjAzMDdlNTQxOGJiNDlkMGNiYzIwYTk3ZTdhMjkyMWFiYzJhOWUiLCJpYXQiOjE3MTMwMjk1ODAsIm5iZiI6MTcxMzAyOTU4MCwiZXhwIjoxNzQ0NTY1NTgwLCJzdWIiOiIxMzEyIiwic2NvcGVzIjpbXX0.RliuVHp7mGPc2Hyg8bURcXhfFYPEtosZMwrUb3jErdTtD2GpcZw0HzZ04fR3vtlg8OqIa8BSm_U72XJwABvt1MsYZMJ65HJV8HKvDg2IX7OQbjeG0hAtDfQV9pgPgKhk2F3S-7SQC0tg1rejwiW6xNJuMfYxH5l2djYlFLCFb5HrKjAg_2eH-GPDrqU3-idqzvFVpAu0sQnT465tQPFFPCH3kOizdevNDxUXs62iD0iOmG0A9RBaBC_JN37MRRAPDC8GlqiuEBVfznTkjBdMdx7zWh1-SPRDPytQv5vhIJpgEkatwYz7yTLp0swvlGQ31_-C8Tj8OrMVUrZfIWfFUdlzd11CaMsWkLj9PlKpjoCMt7cKwkzPDgLgDYkBQO0Tn7PAbqTfTYQUYJCbQuA1wzGfcA6w_oNeZRU2xP7mok0WbVlFCTlZnAxkt15a_XolE0Cyc9g6a_Z2afOb9YmN6lJDWa6rS-WCviPWBhbB8q2K3ww_4kxjowe1FTRiH-gto8fBFkbqjhbBBNXOZjwcjJqL3-dZMKCETXuk5BX53m4FTGKv-inT3bMYSVbCZHsoqgem0qEZE11u3MbviiJKEh5Vh07DK1nF6d07xCyUbObndgzfo7Y8aWuLofnAItqPyRa2r0KsaMszVH4yKvu43NXJ68ZlfoxEyWyX3zcWIa0';
    return dio;
  }

  Dio authorizePexels() {
    final Dio dio = setup();
    dio.options.headers["Authorization"] =
        'wnpztsfWibMyia3IJYBKVk5KeETAie4eYpkORlWzDe2Uhf2uS7bAOOJD';

    return dio;
  }
}
