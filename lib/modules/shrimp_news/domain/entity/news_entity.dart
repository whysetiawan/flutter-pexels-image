import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class NewsEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final DateTime _createdAt;
  final String thumbnailPath;

  const NewsEntity({
    required this.id,
    required this.title,
    required DateTime createdAt,
    required this.thumbnailPath,
    required this.description,
  }) : _createdAt = createdAt;

  get createdAt => DateFormat("d MMMM y").format(_createdAt);

  NewsEntity copyWith({
    String? title,
    DateTime? createdAt,
    String? thumbnailPath,
    String? seoTitle,
    int? id,
  }) {
    return NewsEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? _createdAt,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      description: seoTitle ?? description,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        _createdAt,
        thumbnailPath,
        description,
      ];

  @override
  bool? get stringify => true;
}
