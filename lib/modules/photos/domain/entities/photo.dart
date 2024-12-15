import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int _id;
  final String _url;
  final int _width;
  final int _height;

  const Photo({
    required int id,
    required String url,
    required int width,
    required int height,
  })  : _id = id,
        _url = url,
        _width = width,
        _height = height;

  int get id => _id;
  String get url => _url;
  int get width => _width;
  int get height => _height;

  @override
  List<Object?> get props => [_id];
}
