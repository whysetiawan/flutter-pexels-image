final class ShrimpNewsResponseDto {
  final List<Datum> data;
  final Links? links;
  final Meta? meta;

  const ShrimpNewsResponseDto({required this.data, this.links, this.meta});

  @override
  String toString() {
    return 'ShrimpNewsResponseDto(data: $data, links: $links, meta: $meta)';
  }

  factory ShrimpNewsResponseDto.fromJson(Map<String, dynamic> json) {
    return ShrimpNewsResponseDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
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

final class Links {
  final String? first;
  final String? last;
  final dynamic prev;
  final String? next;

  const Links({this.first, this.last, this.prev, this.next});

  @override
  String toString() {
    return 'Links(first: $first, last: $last, prev: $prev, next: $next)';
  }

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json['first'] as String?,
        last: json['last'] as String?,
        prev: json['prev'] as dynamic,
        next: json['next'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'first': first,
        'last': last,
        'prev': prev,
        'next': next,
      };
}

final class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  @override
  String toString() {
    return 'Meta(currentPage: $currentPage, from: $from, lastPage: $lastPage, path: $path, perPage: $perPage, to: $to, total: $total)';
  }

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json['current_page'] as int?,
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        path: json['path'] as String?,
        perPage: json['per_page'] as int?,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'from': from,
        'last_page': lastPage,
        'path': path,
        'per_page': perPage,
        'to': to,
        'total': total,
      };
}
