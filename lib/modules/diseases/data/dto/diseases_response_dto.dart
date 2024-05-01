final class DiseasesResponseDto {
  final List<Datum> data;
  final Links links;
  final Meta meta;

  const DiseasesResponseDto({
    required this.data,
    required this.links,
    required this.meta,
  });

  @override
  String toString() {
    return 'DiseasesResponseDto(data: $data, links: $links, meta: $meta)';
  }

  factory DiseasesResponseDto.fromJson(Map<String, dynamic> json) {
    return DiseasesResponseDto(
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

class Datum {
  final int id;
  final String fullName;
  final String shortName;
  final String? image;
  final String? slug;
  final String metaDescription;
  final String? metaKeywords;
  final String? status;
  final String? indication;
  final String? pathogen;
  final String? effect;
  final String? stabilityViability;
  final String? handling;
  final String? regulation;
  final String? reference;
  final int? createdBy;
  final int? updatedBy;
  final String createdAt;
  final String updatedAt;

  Datum({
    required this.id,
    required this.fullName,
    required this.shortName,
    required this.image,
    this.slug,
    required this.metaDescription,
    this.metaKeywords,
    this.status,
    this.indication,
    this.pathogen,
    this.effect,
    this.stabilityViability,
    this.handling,
    this.regulation,
    this.reference,
    this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  String toString() {
    return 'Datum(id: $id, fullName: $fullName, shortName: $shortName, image: $image, slug: $slug, metaDescription: $metaDescription, metaKeywords: $metaKeywords, status: $status, indication: $indication, pathogen: $pathogen, effect: $effect, stabilityViability: $stabilityViability, handling: $handling, regulation: $regulation, reference: $reference, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int,
        fullName: json['full_name'] as String,
        shortName: json['short_name'] as String,
        image: json['image'] as String?,
        slug: json['slug'] as String?,
        metaDescription: json['meta_description'] as String,
        metaKeywords: json['meta_keywords'] as String?,
        status: json['status'] as String?,
        indication: json['indication'] as String?,
        pathogen: json['pathogen'] as String?,
        effect: json['effect'] as String?,
        stabilityViability: json['stability_viability'] as String?,
        handling: json['handling'] as String?,
        regulation: json['regulation'] as String?,
        reference: json['reference'] as String?,
        createdBy: json['created_by'] as int?,
        updatedBy: json['updated_by'] as int?,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'short_name': shortName,
        'image': image,
        'slug': slug,
        'meta_description': metaDescription,
        'meta_keywords': metaKeywords,
        'status': status,
        'indication': indication,
        'pathogen': pathogen,
        'effect': effect,
        'stability_viability': stabilityViability,
        'handling': handling,
        'regulation': regulation,
        'reference': reference,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  Meta({
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

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({this.first, this.last, this.prev, this.next});

  @override
  String toString() {
    return 'Links(first: $first, last: $last, prev: $prev, next: $next)';
  }

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json['first'] as String?,
        last: json['last'] as String?,
        prev: json['prev'] as dynamic,
        next: json['next'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'first': first,
        'last': last,
        'prev': prev,
        'next': next,
      };
}
