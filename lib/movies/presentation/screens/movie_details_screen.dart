import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    context.read<MovieDetailsCubit>().getSingleMovie(movieId: widget.movieId);
    // movieDetail.getSingleMovie(movieId: widget.movieDetailModel);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(
                child: SpinKitDoubleBounce(color: Colors.blue),
              );
            }
            if (state is MovieDetailsFetched) {
              final data = state.movieDetailsData;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                            imageUrl:
                                // 'https://images.pexels.com/photos/14966037/pexels-photo-14966037.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                                // data.data.movie.largeCoverImage,
                                data.data.movie.largeCoverImage,
                            // child: Image.network(
                            //   data.data.movie.largeCoverImage,
                            width: width * width,
                            height: height * 0.4,
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        colorFilter: const ColorFilter.mode(
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

                            // ),
                            ),
                        Container(
                          width: width * width,
                          height: height * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black,
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ))),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: height * 0.04,
                          left: width * 0.1,
                          child: const Text(
                            'Preview',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.data.movie.title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(
                              children: [
                                const Text('95% match',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 16)),
                                const SizedBox(width: 10),
                                Text(data.data.movie.year.toString(),
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16)),
                                const SizedBox(width: 10),
                                const Text('2h 49m',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16)),
                                const SizedBox(width: 10),
                                const Text('8.8',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16)),
                                const SizedBox(width: 10),
                                const Text('HD',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(
                                        Icons.thumb_up_alt_rounded,
                                        color: Colors.black)),
                                const SizedBox(width: 20),
                                const Text(
                                  "Most Liked",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('ProLog',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ),
                          const SizedBox(height: 6),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                minimumSize: const Size.fromHeight(48), // NEW
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Play',
                                style: TextStyle(fontSize: 20),
                              )),
                          const SizedBox(height: 8),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                minimumSize: const Size.fromHeight(48), // NEW
                              ),
                              onPressed: () async{
                                var tempDir = await getTemporaryDirectory();
                                  String fullPath = tempDir.path + "/boo2.pdf'";
                                  print('full path ${fullPath}');

                                  download1(dio, imgUrl, fullPath);
                              },
                              child: const Text(
                                'Download',
                                style: TextStyle(fontSize: 20),
                              )),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              data.data.movie.descriptionIntro,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Top Casts',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22)),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: width * width,
                            height: 130,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: data.data.movie.cast!.length,
                              itemBuilder: (context, index) {
                                if (data.data.movie.cast!.isNotEmpty) {
                                  final castData = data.data.movie.cast![index];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(33),
                                          child: CachedNetworkImage(
                                            imageUrl: castData.urlSmallImage
                                                .toString(),
                                            height: 60.0,
                                            width: 60.0,
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url,
                                                    error) =>
                                                Image.network(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWkSWLRxX42sG_oDs7OlqF2x2Vs88aEBqyWA&usqp=CAU'),
                                          ),
                                        ),
                                        // Text(castData.characterName,
                                        //     style: TextStyle(
                                        //         color: Colors.white,
                                        //         fontSize: 16)),
                                        Text(castData.name.toString(),
                                            style: const TextStyle(
                                                color: Colors.grey))
                                      ],
                                    ),
                                  );
                                }

                                return const Text('Could not fetched data',
                                    style: TextStyle(color: Colors.white));
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is MovieDetailsError) {
              return SizedBox(
                child: Center(
                  child: Text(
                    '$state.message',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else {
              return const Text('cast errorrrr');
            }
          },
        ),
      ),
    );
  }
}
