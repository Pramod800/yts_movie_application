import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/movies/data/models/movieDetailsModel.dart';
import 'package:flutter_movie_application/movies/data/models/movieModel.dart';
import 'package:flutter_movie_application/movies/data/movies_data_source/movie_data_source.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this._movieDataSource) : super(MovieInitial());

  final MovieDataSource _movieDataSource;

  void getMovies() async {
    // loading state
    emit(MovieLoading());
    try {
      final movieData = await _movieDataSource.fetchMoviess();
      emit(MovieFetched(movieData));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
