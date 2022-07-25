import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/error_message.dart';
import '../../../core/usecases/usecases.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_up_coming.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  final GetUpComing _upComing;
  UpComingCubit(this._upComing) : super(UpComingInitial());

  void getUpComing() async {
    emit(UpComingLoading());
    final eitherErrorOrUpComing = await _upComing.call(NoParams());
    eitherErrorOrUpComing.fold(
        (l) => emit(UpComingError(msg: ERROR_LOADING_DATA)),
        (r) => emit(UpComingLoaded(movies: r)));
  }
}
