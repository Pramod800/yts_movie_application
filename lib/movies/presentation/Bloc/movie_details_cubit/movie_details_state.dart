part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsFetched extends MovieDetailsState {
  const MovieDetailsFetched(this.movieDetailsData);
  final MovieDetailsModel movieDetailsData;
  @override
  List<Object> get props => [movieDetailsData];
}

class MovieDetailsError extends MovieDetailsState {
  final String message;
  const MovieDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
