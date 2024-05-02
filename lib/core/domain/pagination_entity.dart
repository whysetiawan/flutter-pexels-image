import 'package:equatable/equatable.dart';

base class PaginationEntity extends Equatable {
  final int? _currentPage;
  final int? _lastPage;
  final int? _perPage;
  final int? _total;

  const PaginationEntity({
    int? currentPage,
    int? lastPage,
    int? perPage,
    int? total,
  })  : _currentPage = currentPage,
        _lastPage = lastPage,
        _perPage = perPage,
        _total = total;

  int get currentPage => _currentPage ?? 0;
  int get lastPage => _lastPage ?? 0;
  int get perPage => _perPage ?? 0;
  int get total => _total ?? 0;

  @override
  List<Object?> get props => [
        currentPage,
        lastPage,
        perPage,
        total,
      ];

  @override
  bool? get stringify => true;
}
