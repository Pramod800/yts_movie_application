part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class MovieSearchedInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class MovieSearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class MovieSearchedFetched extends SearchState {
  const MovieSearchedFetched(this.searchedData);
  final MovieModel searchedData;
  @override
  List<Object> get props => [searchedData];
}

class MovieSearchedError extends SearchState {
  final String message;
  const MovieSearchedError(this.message);

  @override
  List<Object> get props => [];
}
