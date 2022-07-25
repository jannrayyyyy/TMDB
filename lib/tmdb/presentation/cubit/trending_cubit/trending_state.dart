part of 'trending_cubit.dart';

class TrendingState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingLoaded({required this.movies});
}

class TrendingError extends TrendingState {
  final String msg;
  TrendingError({required this.msg});
}
