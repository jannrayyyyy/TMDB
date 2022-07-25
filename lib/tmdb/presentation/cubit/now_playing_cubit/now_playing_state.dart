part of 'now_playing_cubit.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLaoding extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  const NowPlayingLoaded({required this.movies});
}

class NowPlayingError extends NowPlayingState {
  final String msg;
  const NowPlayingError({required this.msg});
}
