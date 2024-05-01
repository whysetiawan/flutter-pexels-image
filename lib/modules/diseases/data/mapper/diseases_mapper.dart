import 'package:jala_test/modules/diseases/data/dto/diseases_response_dto.dart';
import 'package:jala_test/modules/diseases/domain/entity/disease_entity.dart';

final class Diseases {
  static List<DiseaseEntity> mapResponseToEntity(DiseasesResponseDto dto) {
    return dto.data
        .map(
          (e) => DiseaseEntity(
            fullName: e.fullName,
            shortName: e.shortName,
            id: e.id,
            createdAt: DateTime.parse(e.createdAt),
            thumbnailPath: e.image,
            description: e.metaDescription,
          ),
        )
        .toList();
  }
}
