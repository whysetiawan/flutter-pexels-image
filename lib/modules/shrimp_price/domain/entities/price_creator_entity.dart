import 'package:equatable/equatable.dart';

final class PriceCreatorEntity extends Equatable {
  final int id;
  final String name;
  final bool isVerified;
  final String occupation;

  const PriceCreatorEntity({
    required this.id,
    required this.name,
    required this.isVerified,
    required this.occupation,
  });

  @override
  List<Object?> get props => [id];
}
