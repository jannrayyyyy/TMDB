import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/error_message.dart';
import '../../../core/usecases/usecases.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_trending.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final GetTrending _trending;
  TrendingCubit(this._trending) : super(TrendingInitial());

  void getTrending() async {
    emit(TrendingLoading());
    final eitherErrorOrTrending = await _trending.call(NoParams());
    eitherErrorOrTrending.fold(
        (l) => emit(TrendingError(msg: ERROR_LOADING_DATA)),
        (r) => emit(TrendingLoaded(movies: r)));
  }
}
