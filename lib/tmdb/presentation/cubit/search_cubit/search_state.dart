part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SearchInitial extends SearchState {}

class Searchloading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieEntity> movies;
  const SearchLoaded({required this.movies});
}

class SearchEmpty extends SearchState {
  final String empty;
  const SearchEmpty({required this.empty});
}

class SearchError extends SearchState {
  final String msg;
  const SearchError({required this.msg});
}
