import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class DiseaseEntity extends Equatable {
  final int id;
  final String fullName;
  final String shortName;
  final String description;
  final DateTime _createdAt;
  final String? _thumbnailPath;

  const DiseaseEntity({
    required this.id,
    required this.fullName,
    required this.shortName,
    required DateTime createdAt,
    String? thumbnailPath,
    required this.description,
  })  : _thumbnailPath = thumbnailPath,
        _createdAt = createdAt;

  String get createdAt => DateFormat("d MMMM y").format(_createdAt);
  String get thumbnailPath => _thumbnailPath ?? "No Image";

  DiseaseEntity copyWith({
    String? title,
    DateTime? createdAt,
    String? thumbnailPath,
    String? seoTitle,
    int? id,
    String? shortName,
  }) {
    return DiseaseEntity(
      id: id ?? this.id,
      fullName: title ?? fullName,
      createdAt: createdAt ?? _createdAt,
      thumbnailPath: thumbnailPath ?? _thumbnailPath,
      description: seoTitle ?? description,
      shortName: shortName ?? this.shortName,
    );
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        _createdAt,
        _thumbnailPath,
        description,
        shortName,
      ];

  @override
  bool? get stringify => true;
}
