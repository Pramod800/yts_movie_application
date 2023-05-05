import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/movies/data/models/movieDetailsModel.dart';
import 'package:flutter_movie_application/movies/data/models/movieModel.dart';
import 'package:permission_handler/permission_handler.dart';

class MovieDataSource {
  MovieDataSource(this._dioClient);

  late final Dio _dioClient;
  Future<MovieModel> fetchMoviess() async {
    try {
      final Response<Map<String, dynamic>> response =
          await _dioClient.get('https://yts.mx/api/v2/list_movies.json');
      if (response.statusCode == 200) {
        final movieDataJson = response.data;

        final MovieModel movieData = MovieModel.fromJson(movieDataJson!);

        return movieData;
      }
    } on DioError catch (dioError) {
      print("DioError catch: ${dioError.message}");
    } catch (e) {
      print("Other exception catch: ${e.toString()}");
    }

    throw Exception('Server Error');
  }

  Future<MovieDetailsModel> fetchMovieDetails({required int movieId}) async {
    try {
      final movieDetailResponse = await _dioClient.get(
        'https://yts.mx/api/v2/movie_details.json?movie_id=$movieId&with_images=true&with_cast=true',
      );

      if (movieDetailResponse.statusCode == 200) {
        final movieJson = movieDetailResponse.data;
        return MovieDetailsModel.fromJson(movieJson);
      }
    } on DioError catch (dioError) {
      print("DioError catch: ${dioError.message}");
    } catch (e) {
      print(" ${e.toString()}");
    }
    throw Exception('Server Error');
  }

  Future<MovieModel> searchMovies({required String query}) async {
    try {
      final searchResponse = await _dioClient.get(
          'https://yts.mx/api/v2/list_movies.json?query_term={$query}&limit=45');
      if (searchResponse.statusCode == 200) {
        final searchJson = searchResponse.data;
        return MovieModel.fromJson(searchJson);
      } else {
        throw Exception('Error Searching Movies');
      }
    } on DioError catch (dioError) {
      print("DioError catch: ${dioError.message}");
    } catch (e) {
      print("Other exception catch: ${e.toString()}");
    }
    throw Exception('Server Error');
  }

  Future<MovieModel> movieSuggetions({required String movieId}) async {
    try {
      final searchResponse = await _dioClient.get(
          'https://yts.mx/api/v2/movie_suggestions.json?movie_id=$movieId');
      if (searchResponse.statusCode == 200) {
        final searchJson = searchResponse.data;
        return MovieModel.fromJson(searchJson);
      } else {
        throw Exception('Error Searching Movies');
      }
    } on DioError catch (dioError) {
      print("DioError catch: ${dioError.message}");
    } catch (e) {
      print("Other exception catch: ${e.toString()}");
    }
    throw Exception('Server Error');
  }

  Future<MovieModel> mostDowloaded() async {
    try {
      final searchResponse = await _dioClient
          .get('https://yts.mx/api/v2/list_movies.json?sort_by=download_count');
      if (searchResponse.statusCode == 200) {
        final searchJson = searchResponse.data;
        return MovieModel.fromJson(searchJson);
      } else {
        throw Exception('Error Searching Movies');
      }
    } on DioError catch (dioError) {
      print("DioError catch: ${dioError.message}");
    } catch (e) {
      print("Other exception catch: ${e.toString()}");
    }
    throw Exception('Server Error');
  }

  Future<MovieModel> sortMovies({required String sortMethod}) async {
    final searchResponse = await _dioClient
        .get('https://yts.mx/api/v2/list_movies.json&?sort_by={$sortMethod}');
    if (searchResponse.statusCode == 200) {
      final searchJson = searchResponse.data;
      return MovieModel.fromJson(searchJson);
    } else {
      throw Exception('Error sorting movies');
    }
  }

  Future downloadFile(Dio dio, String url, String savePath) async {
    var status = await Permission.manageExternalStorage.request();

    if (status.isDenied) {
      throw Exception('Access Denied');
    }

    if (status.isGranted) {
      Response response = await dio.get(
        // 'https://yts.mx/torrent/download/2A8C59FE0A76FDE07831FD1F348CAE8334C0A73B',
        url,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );
      if (response.statusCode == 200) {
        File file = File(savePath);
        var raf = file.openSync(mode: FileMode.write);
        // response.data is List<int> type
        raf.writeFromSync(response.data);
        await raf.close();
      }
      throw 'Failed to download file';
    }
  }
}
