import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/movies/data/models/movieModel.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movies,
    required this.onClick,
  });

  final MovieModel movies;
  final Function(int id) onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
      child: SizedBox(
        height: 220,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: movies.data.movies.length,
          itemBuilder: (context, index) {
            final movie = movies.data.movies[index];
            return GestureDetector(
              onTap: ()
                  => onClick(movie.id),

              //     {
              //   context
              //       .read<MovieDetailsCubit>()
              //       .getSingleMovie(movieId: movie.id);
              // },
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
                      child: Image.network(
                        movies.data.movies[index].largeCoverImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
