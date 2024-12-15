import 'package:pexels_image/core/data/dto/meta_links_response_dto.dart';

final class ShrimpNewsResponseDto {
  final List<Datum> data;
  final Links links;
  final Meta meta;

  const ShrimpNewsResponseDto({
    required this.data,
    required this.links,
    required this.meta,
  });

  @override
  String toString() {
    return 'ShrimpNewsResponseDto(data: $data, links: $links, meta: $meta)';
  }

  factory ShrimpNewsResponseDto.fromJson(Map<String, dynamic> json) {
    return ShrimpNewsResponseDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data.map((e) => e.toJson()).toList(),
        'links': links.toJson(),
        'meta': meta.toJson(),
      };
}

final class Datum {
  final int id;
  final int? authorId;
  final int? categoryId;
  final String image;
  final String? status;
  final bool? featured;
  final dynamic advertisement;
  final String createdAt;
  final String? updatedAt;
  final String title;
  final String seoTitle;
  final String? excerpt;
  final String body;
  final String? slug;
  final String metaDescription;
  final String? metaKeywords;

  const Datum({
    required this.id,
    this.authorId,
    this.categoryId,
    required this.image,
    this.status,
    this.featured,
    this.advertisement,
    required this.createdAt,
    this.updatedAt,
    required this.title,
    required this.seoTitle,
    this.excerpt,
    required this.body,
    this.slug,
    required this.metaDescription,
    this.metaKeywords,
  });

  @override
  String toString() {
    return 'Datum(id: $id, authorId: $authorId, categoryId: $categoryId, image: $image, status: $status, featured: $featured, advertisement: $advertisement, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, seoTitle: $seoTitle, excerpt: $excerpt, body: $body, slug: $slug, metaDescription: $metaDescription, metaKeywords: $metaKeywords)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int,
        authorId: json['author_id'] as int?,
        categoryId: json['category_id'] as int?,
        image: json['image'] as String,
        status: json['status'] as String?,
        featured: json['featured'] as bool?,
        advertisement: json['advertisement'] as dynamic,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String?,
        title: json['title'] as String,
        seoTitle: json['seo_title'],
        excerpt: json['excerpt'] as String?,
        body: json['body'] as String,
        slug: json['slug'] as String?,
        metaDescription: json['meta_description'] as String,
        metaKeywords: json['meta_keywords'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'author_id': authorId,
        'category_id': categoryId,
        'image': image,
        'status': status,
        'featured': featured,
        'advertisement': advertisement,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'title': title,
        'seo_title': seoTitle,
        'excerpt': excerpt,
        'body': body,
        'slug': slug,
        'meta_description': metaDescription,
        'meta_keywords': metaKeywords,
      };
}
