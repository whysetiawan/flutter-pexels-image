import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jala_test/core/data/dio_http.dart';
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

  // Datasources
  sl.registerLazySingleton<ShrimpPriceApiDataSource>(
    () => ShrimpPriceApiDataSource(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<ShrimpPriceLocalDataSource>(
    () => ShrimpPriceLocalDataSource(),
  );

  // Repositories
  sl.registerLazySingleton<ShrimpPriceRepository>(
    () => ShrimpPriceRepositoryImpl(
      shrimpPriceApi: sl(),
      shrimpPriceLocal: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton<GetShrimpSizeUseCase>(
    () => GetShrimpSizeUseCase(shrimpPriceRepository: sl()),
  );
  sl.registerLazySingleton<GetShrimpPricesUseCase>(
    () => GetShrimpPricesUseCase(shrimpPriceRepository: sl()),
  );

  // Bloc
  // sl.registerFactory<ShrimpPriceBloc>(
  //   () => ShrimpPriceBloc(getShrimpPricesUseCase: sl()),
  // );
}
