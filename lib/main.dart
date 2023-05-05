import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/core/router.dart';
import 'package:flutter_movie_application/core/utils/bootstrap.dart';
import 'package:flutter_movie_application/movies/data/models/movieDetailsModel.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/Search_Cubit/search_cubit.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/movie_list_cubit/movie_cubit.dart';
import 'package:flutter_movie_application/movies/presentation/screens/bottom_nav.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'movies/data/movies_data_source/movie_data_source.dart';

void main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(MovieDetailsModelAdapter());
  // Hive.registerAdapter(DataAdapter());
  // Hive.registerAdapter(MovieAdapter());
  // Hive.registerAdapter(CastAdapter());

  await bootstrap();
  runApp(MyApp());
}

GetIt getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieCubit(MovieDataSource(Dio())),
        ),
        BlocProvider(
          create: (context) => SearchCubit(MovieDataSource(Dio())),
        ),
        BlocProvider(
          create: (context) => MovieDetailsCubit(MovieDataSource(Dio())),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        // routerConfig: _appRouter.config(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MovieHomeScreen(),
      ),
    );
    // );
  }
}
