class PaginatedResponseDto<T> {
  final int page;
  final int perPage;
  final List<T> data;
  final int totalResults;
  final String nextPage;

  const PaginatedResponseDto({
    required this.page,
    required this.perPage,
    required this.data,
    required this.totalResults,
    required this.nextPage,
  });

  factory PaginatedResponseDto.fromJson(
    Map<String, dynamic> json,
    List<T> Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return PaginatedResponseDto(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      data: fromJsonT(json),
      totalResults: json['total_results'] as int,
      nextPage: json['next_page'] as String,
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {
      'page': page,
      'per_page': perPage,
      'data': data.map(toJsonT).toList(),
      'total_results': totalResults,
      'next_page': nextPage,
    };
  }
}
