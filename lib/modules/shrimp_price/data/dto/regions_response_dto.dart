import 'package:jala_test/core/data/dto/meta_links_response_dto.dart';

final class Region {
  final String id;
  final String name;
  final dynamic type;
  final String? latitude;
  final String? longitude;
  final String? countryId;
  final String? countryName;
  final String? countryNameUppercase;
  final String provinceId;
  final String provinceName;
  final String? regencyId;
  final String? regencyName;
  final String? districtId;
  final String? districtName;
  final String? villageId;
  final String? villageName;
  final String fullName;
  final String? nameTranslated;
  final String? countryNameTranslated;
  final String? countryNameTranslatedUppercase;

  const Region({
    required this.id,
    required this.name,
    this.type,
    this.latitude,
    this.longitude,
    this.countryId,
    this.countryName,
    this.countryNameUppercase,
    required this.provinceId,
    required this.provinceName,
    this.regencyId,
    this.regencyName,
    this.districtId,
    this.districtName,
    this.villageId,
    this.villageName,
    required this.fullName,
    this.nameTranslated,
    this.countryNameTranslated,
    this.countryNameTranslatedUppercase,
  });

  @override
  String toString() {
    return 'Region(id: $id, name: $name, type: $type, latitude: $latitude, longitude: $longitude, countryId: $countryId, countryName: $countryName, countryNameUppercase: $countryNameUppercase, provinceId: $provinceId, provinceName: $provinceName, regencyId: $regencyId, regencyName: $regencyName, districtId: $districtId, districtName: $districtName, villageId: $villageId, villageName: $villageName, fullName: $fullName, nameTranslated: $nameTranslated, countryNameTranslated: $countryNameTranslated, countryNameTranslatedUppercase: $countryNameTranslatedUppercase)';
  }

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json['id'] as String,
        name: json['name'] as String,
        type: json['type'] as dynamic,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
        countryId: json['country_id'] as String?,
        countryName: json['country_name'] as String?,
        countryNameUppercase: json['country_name_uppercase'] as String?,
        provinceId: json['province_id'] as String,
        provinceName: json['province_name'] as String,
        regencyId: json['regency_id'] as String?,
        regencyName: json['regency_name'] as String?,
        districtId: json['district_id'] as String?,
        districtName: json['district_name'] as String?,
        villageId: json['village_id'] as String?,
        villageName: json['village_name'] as String?,
        fullName: json['full_name'] as String,
        nameTranslated: json['name_translated'] as String?,
        countryNameTranslated: json['country_name_translated'] as String?,
        countryNameTranslatedUppercase:
            json['country_name_translated_uppercase'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'latitude': latitude,
        'longitude': longitude,
        'country_id': countryId,
        'country_name': countryName,
        'country_name_uppercase': countryNameUppercase,
        'province_id': provinceId,
        'province_name': provinceName,
        'regency_id': regencyId,
        'regency_name': regencyName,
        'district_id': districtId,
        'district_name': districtName,
        'village_id': villageId,
        'village_name': villageName,
        'full_name': fullName,
        'name_translated': nameTranslated,
        'country_name_translated': countryNameTranslated,
        'country_name_translated_uppercase': countryNameTranslatedUppercase,
      };
}

final class RegionsResponseDto {
  final List<Region> data;
  final Links links;
  final Meta meta;

  const RegionsResponseDto({
    required this.links,
    required this.meta,
    required this.data,
  });

  factory RegionsResponseDto.fromJson(Map<String, dynamic> json) =>
      RegionsResponseDto(
        data: (json['data'] as List<dynamic>)
            .map((e) => Region.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data.map((e) => e.toJson()).toList(),
        'links': links.toJson(),
        'meta': meta.toJson(),
      };

  @override
  String toString() {
    return 'RegionsResponseDto(data: $data, links: $links, meta: $meta)';
  }
}
