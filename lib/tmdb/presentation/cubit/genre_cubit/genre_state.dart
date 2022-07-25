part of 'genre_cubit.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreInitial extends GenreState {}

class GenreLoading extends GenreState {}

class GenreLoaded extends GenreState {
  final List<MovieEntity> movies;
  const GenreLoaded({required this.movies});
}

class GenreError extends GenreState {
  final String msg;
  const GenreError({required this.msg});
}
