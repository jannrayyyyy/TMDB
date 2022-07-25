part of 'popular_cubit.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final List<MovieEntity> movies;
  const PopularLoaded({required this.movies});
}

class PopularError extends PopularState {
  final String msg;
  const PopularError({required this.msg});
}
