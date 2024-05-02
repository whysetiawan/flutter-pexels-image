class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
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
        perPage: int.tryParse(json['per_page'].toString()),
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
