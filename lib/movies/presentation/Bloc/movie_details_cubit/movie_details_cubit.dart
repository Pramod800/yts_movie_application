import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_application/movies/data/models/movieDetailsModel.dart';
import 'package:flutter_movie_application/movies/data/movies_data_source/movie_data_source.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDataSource _movieDataSource;
  MovieDetailsCubit(this._movieDataSource) : super(MovieDetailsInitial());

  void getSingleMovie({required int movieId}) async {
    emit(MovieDetailsLoading());
    try {
      final movieDetailsData =
          await _movieDataSource.fetchMovieDetails(movieId: movieId);
      emit(MovieDetailsFetched(movieDetailsData));
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
