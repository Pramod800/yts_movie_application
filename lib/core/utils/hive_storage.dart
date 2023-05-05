import 'dart:convert';

import 'package:flutter_movie_application/movies/data/models/movieDetailsModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveUtils {
  static Box? _ourDataBase;

  static initDb() async {
    _ourDataBase = Hive.box('movieDB');
  }

  /// ENCODING=> Object -> String
  static storeSingleMovie(MovieDetailsModel data) {
    final Map<String, dynamic> movieJson = data.toJson();
    final String encodedJsonString = jsonEncode(movieJson);

    //print("ENCODE MOVIE OBJECT ${encodedJson.toString()}");
    _ourDataBase?.put('singleMovie', encodedJsonString);
  }

  // / DECODING=> String -> Object
  static fetchSingleMovie() {
    final String storedMovieString = _ourDataBase?.get('singleMovie');
    final Map<String, dynamic> decodedJson = jsonDecode(storedMovieString);
    final data=decodedJson.length;
    print(data);
    final MovieDetailsModel storedMovie =
        MovieDetailsModel.fromJson(decodedJson);
    // print("fetched movie ${storedMovie.title}");
  }

  // static storeMovies(List<MovieCardModel> movies) {
  //   _ourDataBase?.put('Movies', movies);
  // }

  // static List fetchMovies() {
  //   final List movies = _ourDataBase?.get('Movies') ?? [];
  //   //print("MOVIES LENGTH ${movies.length}");
  //   return movies;
}
