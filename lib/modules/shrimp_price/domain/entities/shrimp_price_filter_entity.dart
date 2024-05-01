import 'package:equatable/equatable.dart';

class ShrimpPriceFilterEntity extends Equatable {
  final int size;
  final String? regionId;

  const ShrimpPriceFilterEntity({
    this.size = 100,
    this.regionId,
  });

  ShrimpPriceFilterEntity copyWith({
    int? size,
    String? regionId,
  }) {
    return ShrimpPriceFilterEntity(
      size: size ?? this.size,
      regionId: regionId ?? this.regionId,
    );
  }

  @override
  List<Object?> get props => [size, regionId];
}
