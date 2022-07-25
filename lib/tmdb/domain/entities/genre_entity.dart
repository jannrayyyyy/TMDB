import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  final int? id;
  final String? name;

  const GenreEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [];
}
