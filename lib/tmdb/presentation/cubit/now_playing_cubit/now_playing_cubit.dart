import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/error_message.dart';
import '../../../core/usecases/usecases.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/now_playing.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final NowPlaying _nowPlaying;
  NowPlayingCubit(this._nowPlaying) : super(NowPlayingInitial());

  void nowPlaying() async {
    emit(NowPlayingLaoding());
    final eitherPlayOrErorr = await _nowPlaying.call(NoParams());

    eitherPlayOrErorr.fold(
        (l) => emit(const NowPlayingError(msg: ERROR_LOADING_DATA)),
        (r) => emit(NowPlayingLoaded(movies: r)));
  }
}
