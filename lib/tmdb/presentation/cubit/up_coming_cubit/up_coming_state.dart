part of 'up_coming_cubit.dart';

class UpComingState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UpComingInitial extends UpComingState {}

class UpComingLoading extends UpComingState {}

class UpComingLoaded extends UpComingState {
  final List<MovieEntity> movies;
  UpComingLoaded({required this.movies});
}

class UpComingError extends UpComingState {
  final String msg;
  UpComingError({required this.msg});
}
