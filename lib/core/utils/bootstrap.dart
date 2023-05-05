import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/main.dart';
import 'package:flutter_movie_application/movies/data/movies_data_source/movie_data_source.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/movie_list_cubit/movie_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(MovieCardAdapter());
  await Hive.openBox('movieDB');
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<MovieDataSource>(
      () => MovieDataSource(getIt<Dio>()));
  // getIt.registerLazySingleton<MovieRepository>(
  //     () => (MovieDataSource(Dio())));

  // getIt.registerLazySingleton<AppRouter>(() => AppRouter());

  getIt.registerLazySingleton<MovieCubit>(
      () => MovieCubit(MovieDataSource(Dio())));

  getIt.registerLazySingleton<MovieDetailsCubit>(
      () => MovieDetailsCubit(getIt<MovieDataSource>()));
}
