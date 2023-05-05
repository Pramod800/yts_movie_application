import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/movie_list_cubit/movie_cubit.dart';
import 'package:flutter_movie_application/movies/presentation/screens/movie_details_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllMovies extends StatefulWidget {
  const AllMovies({super.key});

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trending Movies',
              style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 6),
            BlocBuilder<MovieCubit, MovieState>(
              // bloc: _movieCubit,
              builder: (context, state) {
                if (state is MovieLoading) {
                  return const SizedBox();
                }
                if (state is MovieFetched) {
                  final movies = state.moviesData;
                  return SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: movies.data.movies.length,
                      itemBuilder: (context, index) {
                        final data = movies.data.movies[index];
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<MovieDetailsCubit>()
                                .getSingleMovie(movieId: data.id);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(movieId: data.id),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(3, 5, 5, 8),
                            child: Container(
                              height: 220,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Opacity(
                                  opacity: 0.8,
                                  child: CachedNetworkImage(
                                      imageUrl: movies
                                          .data.movies[index].largeCoverImage,
                                      fit: BoxFit.fill,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Colors.black12,
                                                          BlendMode.colorBurn)),
                                            ),
                                          ),
                                      placeholder: (context, url) =>
                                          const SpinKitPulsingGrid(
                                            color: Colors.indigo,
                                          ),
                                      errorWidget: (context, url, error) =>
                                          // Image.asset(
                                          //     'assets/images/erroe.jpg'),
                                          Image.network(
                                              'https://media.istockphoto.com/id/924949200/vector/404-error-page-or-file-not-found-icon.jpg?s=170667a&w=0&k=20&c=gsR5TEhp1tfg-qj1DAYdghj9NfM0ldfNEMJUfAzHGtU=',
                                              fit: BoxFit.fill)

                                      // child: Image.network(
                                      //   movies.data.movies[index].largeCoverImage,
                                      //   fit: BoxFit.fill,
                                      // ),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox(
                  child: Center(
                      child: Text(
                    'Data Not found',
                    style: TextStyle(color: Colors.white),
                  )),
                );
              },
            ),
            const SizedBox(height: 15),
            const Text(
              'Latest Movies',
              style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 6),
            BlocBuilder<MovieCubit, MovieState>(
              // bloc: _movieCubit,
              builder: (context, state) {
                if (state is MovieLoading) {
                  return const SizedBox();
                }
                if (state is MovieFetched) {
                  final movies = state.moviesData;
                  return SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: movies.data.movies.length,
                      itemBuilder: (context, index) {
                        final data = movies.data.movies[index];
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<MovieDetailsCubit>()
                                .getSingleMovie(movieId: data.id);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(movieId: data.id),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(3, 5, 5, 8),
                            child: Container(
                              height: 220,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Opacity(
                                  opacity: 0.8,
                                  child: CachedNetworkImage(
                                      imageUrl: movies
                                          .data.movies[index].largeCoverImage,
                                      fit: BoxFit.fill,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Colors.black12,
                                                          BlendMode.colorBurn)),
                                            ),
                                          ),
                                      placeholder: (context, url) =>
                                          const SpinKitPulsingGrid(
                                            color: Colors.indigo,
                                          ),
                                      errorWidget: (context, url, error) =>
                                          // Image.asset(
                                          //     'assets/images/erroe.jpg'),
                                          Image.network(
                                              'https://media.istockphoto.com/id/924949200/vector/404-error-page-or-file-not-found-icon.jpg?s=170667a&w=0&k=20&c=gsR5TEhp1tfg-qj1DAYdghj9NfM0ldfNEMJUfAzHGtU=',
                                              fit: BoxFit.fill)

                                      // child: Image.network(
                                      //   movies.data.movies[index].largeCoverImage,
                                      //   fit: BoxFit.fill,
                                      // ),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox(
                  child: Center(
                      child: Text(
                    'Data Not found',
                    style: TextStyle(color: Colors.white),
                  )),
                );
              },
            ),
            const SizedBox(height: 15),
            const Text(
              'Populars Movies',
              style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 6),
            BlocBuilder<MovieCubit, MovieState>(
              // bloc: _movieCubit,
              builder: (context, state) {
                if (state is MovieLoading) {
                  return const SizedBox();
                }
                if (state is MovieFetched) {
                  final movies = state.moviesData;
                  return SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: movies.data.movies.length,
                      itemBuilder: (context, index) {
                        final data = movies.data.movies[index];
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<MovieDetailsCubit>()
                                .getSingleMovie(movieId: data.id);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(movieId: data.id),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(3, 5, 5, 8),
                            child: Container(
                              height: 220,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Opacity(
                                  opacity: 0.8,
                                  child: CachedNetworkImage(
                                      imageUrl: movies
                                          .data.movies[index].largeCoverImage,
                                      fit: BoxFit.fill,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Colors.black12,
                                                          BlendMode.colorBurn)),
                                            ),
                                          ),
                                      placeholder: (context, url) =>
                                          const SpinKitPulsingGrid(
                                            color: Colors.indigo,
                                          ),
                                      errorWidget: (context, url, error) =>
                                          // Image.asset(
                                          //     'assets/images/erroe.jpg'),
                                          Image.network(
                                              'https://media.istockphoto.com/id/924949200/vector/404-error-page-or-file-not-found-icon.jpg?s=170667a&w=0&k=20&c=gsR5TEhp1tfg-qj1DAYdghj9NfM0ldfNEMJUfAzHGtU=',
                                              fit: BoxFit.fill)

                                      // child: Image.network(
                                      //   movies.data.movies[index].largeCoverImage,
                                      //   fit: BoxFit.fill,
                                      // ),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox(
                  child: Center(
                      child: Text(
                    'Data Not found',
                    style: TextStyle(color: Colors.white),
                  )),
                );
              },
            ),
          ],
        ),
      ))),
    );
  }
}
