part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieFetched extends MovieState {
  const MovieFetched(this.moviesData);
  final MovieModel moviesData;
  @override
  List<Object> get props => [moviesData];
}

class MovieError extends MovieState {
  final String message;
  const MovieError(this.message);

  @override
  List<Object> get props => [message];
}
