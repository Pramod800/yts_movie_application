import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/movies/data/models/movieModel.dart';
import 'package:flutter_movie_application/movies/presentation/screens/movie_details_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchedMovieList extends StatelessWidget {
  const SearchedMovieList({
    super.key,
    required TextEditingController searchController,
    required this.searchedData,
    required this.height,
    required this.width,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final MovieModel searchedData;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Row(
              children: [
                Text(
                  'Search Results for ${_searchController.text.trim()}',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    searchedData.data.movies.length.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort Movies',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Expanded(child: Container()),
                const Text(
                  'Genre',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Upload Date',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchedData.data.movies.length,
                itemBuilder: (context, index) {
                  final singleData = searchedData.data.movies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailScreen(movieId: singleData.id),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      child: Container(
                        height: height * 0.15,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              child: CachedNetworkImage(
                                imageUrl: singleData.largeCoverImage,
                                width: width * 0.35,
                                fit: BoxFit.fill,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const SpinKitPulsingGrid(
                                  color: Colors.blue,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.52,
                                        child: Text(
                                          singleData.title,
                                          textAlign: TextAlign.justify,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      // Text(
                                      //     singleData.year
                                      //         .toString(),
                                      //     style:
                                      //         const TextStyle(
                                      //             color: Colors
                                      //                 .blue))
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.5,
                                    child: Text(
                                      (singleData.descriptionFull == "")
                                          ? "No Descriprion Found"
                                          : "(${singleData.descriptionFull})",
                                      // singleData.descriptionFull,
                                      maxLines: 4,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ]
          // ]
          ),
    );
  }
}
