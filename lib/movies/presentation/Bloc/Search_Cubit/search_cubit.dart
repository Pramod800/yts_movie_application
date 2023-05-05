import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_application/movies/data/models/movieModel.dart';
import 'package:flutter_movie_application/movies/data/movies_data_source/movie_data_source.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final MovieDataSource _movieDataSource;
  SearchCubit(this._movieDataSource) : super(MovieSearchedInitial());

  void getSearchList({required String queryFromUI}) async {
    // loading state
    emit(MovieSearchLoading());
    try {
      final movieSearchedData =
          await _movieDataSource.searchMovies(query: queryFromUI);
      emit(MovieSearchedFetched(movieSearchedData));
      // _checkResultResponse(movieSearchedData);
    } catch (e) {
      emit(MovieSearchedError(e.toString()));
    }
  }

  // void _checkResultResponse(MovieModel? movieSearchedData) {
  //   if (movieSearchedData != null && movieSearchedData.data.movies.isNotEmpty) {
  //     emit(MovieSearchedFetched(movieSearchedData));
  //   } else {
  //     // ignore: prefer_const_constructors
  //     emit(  MovieSearchedError(.toString()));
  //   }
  // }
}
