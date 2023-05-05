import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/core/utils/hive_storage.dart';
import 'package:flutter_movie_application/movies/data/models/movieDetailsModel.dart';

@RoutePage()
class BookMarkedScreen extends StatefulWidget {
  const BookMarkedScreen({super.key});

  @override
  State<BookMarkedScreen> createState() => _BookMarkedScreenState();
}

class _BookMarkedScreenState extends State<BookMarkedScreen> {
  late MovieDetailsModel movieDetailsModel;

  @override
  void initState() {
    super.initState();
    _fetchStoredMovies();
  }

  void _fetchStoredMovies() {
    final data = HiveUtils.fetchSingleMovie();
    movieDetailsModel = MovieDetailsModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          child: const Text('BookMarked Screen'),
        ),
      ),
    ));
  }
}
