import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pexels_image/core/data/dio_http.dart';
import 'package:pexels_image/modules/photos/data/api/photos_api.dart';
import 'package:pexels_image/modules/photos/data/photos_repository_impl.dart';
import 'package:pexels_image/modules/photos/domain/photos_repository.dart';
import 'package:pexels_image/modules/photos/domain/usecase/get_photos_usecase.dart';

import 'package:pexels_image/modules/shrimp_news/data/api/shrimp_news_api_datasource.dart';
import 'package:pexels_image/modules/shrimp_news/data/shrimp_news_repository_impl.dart';
import 'package:pexels_image/modules/shrimp_news/domain/shrimp_news_repository.dart';
import 'package:pexels_image/modules/shrimp_news/domain/usecases/get_shrimp_news_usecase.dart';

import 'package:pexels_image/shared/constants/api_url.dart';

final sl = GetIt.instance;

void injectDependencies() {
  // http client
  sl.registerLazySingleton<Dio>(() => DioHttp().setup());
  sl.registerLazySingleton<Dio>(
    () => DioHttp().setupWithToken(),
    instanceName: "DIO_WITH_TOKEN",
  );

  sl.registerLazySingleton(
    () => DioHttp(
      baseUrl: API_URL.PEXEL_API_URL,
    ).authorizePexels(),
    instanceName: "PEXELS_HTTP_CLIENT",
  );

  // Datasources
  sl.registerLazySingleton<PhotosApiDataSource>(
    () => PhotosApiDataSource(
      client: sl(
        instanceName: "PEXELS_HTTP_CLIENT",
      ),
    ),
  );

  sl.registerLazySingleton<ShrimpNewsApiDataSource>(
    () => ShrimpNewsApiDataSource(client: sl()),
  );

  // Repositories
  sl.registerLazySingleton<PhotosRepository>(
    () => PhotosRepositoryImpl(
      photosApiDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<ShrimpNewsRepository>(
    () => ShrimpNewsRepositoryImpl(
      shrimpApiDataSource: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton(
    () => GetPhotosUseCase(photosRepository: sl()),
  );

  sl.registerLazySingleton<GetShrimpNewsUseCase>(
    () => GetShrimpNewsUseCase(shrimpNewsRepository: sl()),
  );
}
