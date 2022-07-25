import 'package:equatable/equatable.dart';

class ProductionCountryEntity extends Equatable {
  ProductionCountryEntity({
    required this.iso31661,
    required this.name,
  });

  final String? iso31661;
  final String? name;

  @override
  List<Object> get props => [];
}