import 'package:equatable/equatable.dart';
import 'package:jala_test/core/domain/pagination_entity.dart';

final class PaginatedRegionEntity extends PaginationEntity {
  final List<RegionEntity> data;
  const PaginatedRegionEntity({
    required this.data,
    super.currentPage = 0,
    super.lastPage = 0,
    super.perPage = 0,
    super.total = 0,
  });

  PaginatedRegionEntity copyWith({
    int? currentPage,
    int? lastPage,
    int? perPage,
    int? total,
    List<RegionEntity>? data,
  }) {
    return PaginatedRegionEntity(
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        currentPage,
        lastPage,
        perPage,
        total,
        data,
      ];
}

final class RegionEntity extends Equatable {
  final String id;
  final String fullName;
  final String name;

  const RegionEntity({
    required this.id,
    required this.fullName,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        name,
      ];
}
