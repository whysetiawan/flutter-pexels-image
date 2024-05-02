import 'package:equatable/equatable.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/region_entity.dart';

class ShrimpPriceFilterEntity extends Equatable {
  final int size;
  final RegionEntity? _region;

  const ShrimpPriceFilterEntity({
    this.size = 100,
    RegionEntity? region,
  }) : _region = region;

  RegionEntity get region =>
      _region ??
      const RegionEntity(
        id: '0',
        fullName: 'Indonesia',
        name: 'Indonesia',
      );

  ShrimpPriceFilterEntity copyWith({
    int? size,
    String? regionId,
    RegionEntity? region,
  }) {
    return ShrimpPriceFilterEntity(
      size: size ?? this.size,
      region: region ?? _region,
    );
  }

  @override
  List<Object?> get props => [size, _region];
}
