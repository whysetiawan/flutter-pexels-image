import 'package:jala_test/modules/diseases/data/api/diseases_api_datasource.dart';
import 'package:jala_test/modules/diseases/domain/diseases_repository.dart';
import 'package:jala_test/modules/diseases/domain/entity/disease_entity.dart';

final class DiseasesRepositoryImpl implements DiseasesRepository {
  final DiseasesApiDataSource _shrimpApiDatasource;

  DiseasesRepositoryImpl({
    required DiseasesApiDataSource shrimpApiDataSource,
  }) : _shrimpApiDatasource = shrimpApiDataSource;
  @override
  Future<List<DiseaseEntity>> getDiseaseList() {
    return _shrimpApiDatasource.getDiseaseList();
  }
}
