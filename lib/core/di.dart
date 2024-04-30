import 'package:get_it/get_it.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_api_datasource.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_local_datasource.dart';
import 'package:jala_test/modules/shrimp_price/domain/usecases/get_shrimp_size_usecase.dart';

final sl = GetIt.instance;
void injectDependencies() {
  // Repositories

  sl.registerLazySingleton<ShrimpPriceApiDataSource>(
    () => ShrimpPriceApiDataSource(),
  );
  sl.registerLazySingleton<ShrimpPriceLocalDataSource>(
    () => ShrimpPriceLocalDataSource(),
  );

  // Usecases
  sl.registerLazySingleton<GetShrimpSizeUseCase>(
    () => GetShrimpSizeUseCase(shrimpPriceApi: sl()),
  );
}
