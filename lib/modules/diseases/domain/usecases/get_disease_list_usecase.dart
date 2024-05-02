import 'package:jala_test/core/domain/base_usecase.dart';
import 'package:jala_test/core/domain/usecase_result.dart';
import 'package:jala_test/modules/diseases/domain/entity/disease_entity.dart';
import 'package:jala_test/modules/diseases/domain/diseases_repository.dart';

final class GetDiseaseListUseCase
    extends BaseUsecase<Future<Result<List<DiseaseEntity>, Exception?>>, void> {
  final DiseasesRepository _diseasesRepository;

  GetDiseaseListUseCase({
    required DiseasesRepository diseasesRepository,
  }) : _diseasesRepository = diseasesRepository;

  @override
  Future<Result<List<DiseaseEntity>, Exception>> invoke(void params) async {
    // try {
    final result = await _diseasesRepository.getDiseaseList();
    return Result.success(result);
    // } catch (e) {
    //   return Result.failure(e as Exception);
    // }
  }
}
