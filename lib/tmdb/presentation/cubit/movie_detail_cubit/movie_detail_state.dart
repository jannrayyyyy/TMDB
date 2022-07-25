part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movieDetail;
  const MovieDetailLoaded({
    required this.movieDetail,
  });
}

class MovieDetailError extends MovieDetailState {
  final String error;
  const MovieDetailError({
    required this.error,
  });
}
