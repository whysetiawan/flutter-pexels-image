import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jala_test/core/data/dio_http.dart';
import 'package:jala_test/modules/diseases/data/api/diseases_api_datasource.dart';
import 'package:jala_test/modules/diseases/data/diseases_repository_impl.dart';
import 'package:jala_test/modules/diseases/domain/diseases_repository.dart';
import 'package:jala_test/modules/diseases/domain/usecases/get_disease_list_usecase.dart';
import 'package:jala_test/modules/shrimp_news/data/api/shrimp_news_api_datasource.dart';
import 'package:jala_test/modules/shrimp_news/data/shrimp_news_repository_impl.dart';
import 'package:jala_test/modules/shrimp_news/domain/shrimp_news_repository.dart';
import 'package:jala_test/modules/shrimp_news/domain/usecases/get_shrimp_news_usecase.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_api_datasource.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_local_datasource.dart';
import 'package:jala_test/modules/shrimp_price/data/shrimp_price_repository_impl.dart';
import 'package:jala_test/modules/shrimp_price/domain/shrimp_price_repository.dart';
import 'package:jala_test/modules/shrimp_price/domain/usecases/get_shrimp_prices_usecase.dart';
import 'package:jala_test/modules/shrimp_price/domain/usecases/get_shrimp_size_usecase.dart';

final sl = GetIt.instance;
void injectDependencies() {
  // http client
  sl.registerLazySingleton<Dio>(() => DioHttp().setup());
  sl.registerLazySingleton<Dio>(
    () => DioHttp().setupWithToken(),
    instanceName: "DIO_WITH_TOKEN",
  );

  // Datasources
  sl.registerLazySingleton<ShrimpPriceApiDataSource>(
    () => ShrimpPriceApiDataSource(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<ShrimpPriceLocalDataSource>(
    () => ShrimpPriceLocalDataSource(),
  );
  sl.registerLazySingleton<ShrimpNewsApiDataSource>(
    () => ShrimpNewsApiDataSource(client: sl()),
  );
  sl.registerLazySingleton<DiseasesApiDataSource>(
    () => DiseasesApiDataSource(client: sl(instanceName: "DIO_WITH_TOKEN")),
  );

  // Repositories
  sl.registerLazySingleton<ShrimpPriceRepository>(
    () => ShrimpPriceRepositoryImpl(
      shrimpPriceApi: sl(),
      shrimpPriceLocal: sl(),
    ),
  );
  sl.registerLazySingleton<ShrimpNewsRepository>(
    () => ShrimpNewsRepositoryImpl(
      shrimpApiDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<DiseasesRepository>(
    () => DiseasesRepositoryImpl(
      shrimpApiDataSource: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton<GetShrimpSizeUseCase>(
    () => GetShrimpSizeUseCase(shrimpPriceRepository: sl()),
  );
  sl.registerLazySingleton<GetShrimpPricesUseCase>(
    () => GetShrimpPricesUseCase(shrimpPriceRepository: sl()),
  );
  sl.registerLazySingleton<GetShrimpNewsUseCase>(
    () => GetShrimpNewsUseCase(shrimpNewsRepository: sl()),
  );
  sl.registerLazySingleton<GetDiseaseListUseCase>(
    () => GetDiseaseListUseCase(diseasesRepository: sl()),
  );
}
