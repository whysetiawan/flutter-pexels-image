import 'package:jala_test/modules/diseases/domain/entity/disease_entity.dart';

abstract interface class DiseasesRepository {
  Future<List<DiseaseEntity>> getDiseaseList();
}
