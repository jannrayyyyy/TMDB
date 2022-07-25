import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/error_message.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/search_movie.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMovie _search;
  SearchCubit(this._search) : super(SearchInitial());

  void getSearch({required String query}) async {
    if (query.isEmpty) {
      emit(const SearchEmpty(empty: EMPTY_MESSAGE));
    } else {
      emit(Searchloading());
    }

    final eitherErrorOrSearch =
        await _search.call(SearchMovieParams(query: query));

    eitherErrorOrSearch.fold(
        (l) => emit(const SearchError(msg: ERROR_LOADING_DATA)),
        (r) => emit(SearchLoaded(movies: r)));
  }
}
