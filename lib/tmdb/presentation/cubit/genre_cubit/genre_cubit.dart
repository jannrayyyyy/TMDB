import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/error_message.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_genra.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final GetGenres _genres;
  GenreCubit(this._genres) : super(GenreInitial());

  void chooseGenre({required int id}) async {
    emit(GenreLoading());
    final eitherResultOrError = await _genres.call(ChooseParams(genreid: id));
    eitherResultOrError
        .fold((l) => emit(const GenreError(msg: ERROR_LOADING_DATA)), (r) {
      emit(GenreLoaded(movies: r));
    });
  }
}
