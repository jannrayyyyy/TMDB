import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/error_message.dart';
import '../../../core/usecases/usecases.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_popular.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final GetPopular _getPopular;
  PopularCubit(this._getPopular) : super(PopularInitial());

  void getPopular() async {
    emit(PopularLoading());
    final eitherErrorOrPopular = await _getPopular.call(NoParams());
    eitherErrorOrPopular.fold(
        (l) => emit(const PopularError(msg: ERROR_LOADING_DATA)),
        (r) => emit(PopularLoaded(movies: r)));
  }
}
