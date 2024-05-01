import 'package:dio/dio.dart';
import 'package:jala_test/modules/diseases/data/dto/diseases_response_dto.dart';
import 'package:jala_test/modules/diseases/data/mapper/diseases_mapper.dart';
import 'package:jala_test/modules/diseases/domain/entity/disease_entity.dart';

class DiseasesApiDataSource {
  final Dio client;

  const DiseasesApiDataSource({required this.client});

  Future<List<DiseaseEntity>> getDiseaseList() async {
    final response = await client.get('/diseases', queryParameters: {
      'page': 1,
      'limit': 15,
    });
    return Diseases.mapResponseToEntity(
      DiseasesResponseDto.fromJson(response.data),
    );
  }
}
