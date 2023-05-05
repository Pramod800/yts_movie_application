import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/movie_list_cubit/movie_cubit.dart';
import 'package:flutter_movie_application/movies/presentation/screens/all_movies.dart';
import 'package:flutter_movie_application/movies/presentation/screens/movie_details_screen.dart';
import 'package:flutter_movie_application/movies/presentation/screens/movies_search_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  // late MovieCubit _movieCubit;
  // late MovieDetailsCubit _movieDetailsCubit;
  // late final Function(int id) onClick;

  @override
  void initState() {
    super.initState();
    // _movieCubit = getIt<MovieCubit>();
    // _movieCubit.getMovies();
    // _movieDetailsCubit=context.read<MovieDetailsCubit>().getSingleMovie(movieId: movieId)
    // _movieDetailsCubit = getIt<MovieDetailsCubit>();
    // _movieCubit = getIt<MovieCubit>();

    context.read<MovieCubit>().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocListener<MovieCubit, MovieState>(
      listener: (context, state) {
        if (state is MovieError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(state.message),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // Image.asset('assets/images/image-1.jpg'),
                  Image.network(
                      'https://images.pexels.com/photos/14966037/pexels-photo-14966037.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                      width: double.infinity,
                      height: 480,
                      fit: BoxFit.cover),
                  Container(
                    height: 480.0,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.0)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              // child: Image.asset('assets/images/profile.jpg',
                              //     fit: BoxFit.cover),
                              child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MOvieSearchScreen(),
                              ),
                            );
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/images/search1.png'),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: width * 0.28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded(child: Container()),
                        InkWell(
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Play',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                'Details',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Trending Now',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AllMovies(),
                          ),
                        );
                      },
                      child: const Text('See all',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
              BlocBuilder<MovieCubit, MovieState>(
                // bloc: _movieCubit,
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const SpinKitDoubleBounce(
                      color: Colors.blue,
                    );
                  }
                  if (state is MovieFetched) {
                    final movies = state.moviesData;
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
                            final data = movies.data.movies[index];
                            return GestureDetector(
                              onTap: () {
                                // _movieDetailsCubit.getSingleMovie(
                                //     movieId: data.id);
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
                                          imageUrl: movies.data.movies[index]
                                              .largeCoverImage,
                                          fit: BoxFit.fill,
                                          imageBuilder: (context,
                                                  imageProvider) =>
                                              Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                      colorFilter:
                                                          const ColorFilter
                                                                  .mode(
                                                              Colors.black12,
                                                              BlendMode
                                                                  .colorBurn)),
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
                                                  fit: BoxFit.fill)),
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
                  return const SizedBox(
                    child: Center(
                        child: Text(
                      'Data Not found',
                      style: TextStyle(color: Colors.white),
                    )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
























// import 'dart:developer';

// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_movie_application/movies/data/models/movieModel.dart';
// import 'package:flutter_movie_application/movies/presentation/provider/movies_provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class HomePageScreenScreen extends StatefulWidget {
//   const HomePageScreenScreen({super.key});

//   @override
//   State<HomePageScreenScreen> createState() => _HomePageScreenScreenState();
// }

// class _HomePageScreenScreenState extends State<HomePageScreenScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<MoviesScreenProvider>(context, listen: false).getAllMovies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     int selectedTab = 0;

//     changeTab(int index) {
//       setState(() {
//         selectedTab = index;
//       });
//     }

//     return Scaffold(
//       backgroundColor: Colors.black,
//       bottomNavigationBar: BottomNavigationBar(
//         // elevation: 20,
//         backgroundColor: Colors.black12,
//         type: BottomNavigationBarType.fixed,
//         // fixedColor: Colors.black45,

//         currentIndex: selectedTab,
//         onTap: (index) => changeTab(index),
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(FontAwesomeIcons.thumbsUp), label: "Liked"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: "Settings"),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Image.network(
//                     ('https://images.unsplash.com/photo-1544526226-d4568090ffb8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aGQlMjBpbWFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
//                     width: double.infinity,
//                     height: 480,
//                     fit: BoxFit.cover),
//                 Container(
//                   height: 480.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     gradient: LinearGradient(
//                       begin: FractionalOffset.topCenter,
//                       end: FractionalOffset.bottomCenter,
//                       colors: [
//                         Colors.grey.withOpacity(0.0),
//                         Colors.black,
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               color: Colors.grey,
//                               border: Border.all(color: Colors.white),
//                               borderRadius: BorderRadius.circular(25.0)),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.network(
//                                 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
//                                 fit: BoxFit.cover),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                             height: 40,
//                             width: 40,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 border: Border.all(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(25.0)),
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20.0),
//                                 child: Image.network(
//                                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMdmCYT0sg_qKuMwywHAw95PqyS2MXCzX7Iw&usqp=CAU'))

//                             // const Icon(FontAwesomeIcons.searchengin),
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: width * 0.25,
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 35,
//                           width: 100,
//                           decoration: BoxDecoration(
//                               color: Colors.grey,
//                               border: Border.all(color: Colors.blue),
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Icon(
//                                 Icons.play_arrow,
//                                 color: Colors.white,
//                               ),
//                               Text(
//                                 'Play',
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.white),
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             height: 35,
//                             width: 100,
//                             decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 border: Border.all(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: const Center(
//                               child: Text(
//                                 'Details',
//                                 style: TextStyle(
//                                     fontSize: 18, color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text('Trending Now',
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                       )),
//                   Text('See all',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                       )),

//                   // Icon(
//                   //   EvaIcons.personDelete,
//                   //   color: Colors.white,
//                   // ),

//                   // Icon(Icons.more_vert, color: Colors.white)
//                 ],
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GestureDetector(
//                       onTap: () {},
//                       child: Consumer<MoviesScreenProvider>(
//                           builder: (context, value, child) {
//                         if (value.isLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//                         if (value.movie.isNotEmpty) {
//                           return ListView.builder(
//                             itemCount: value.movie.data.movies.length,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 height: 210,
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.black38),
//                                     borderRadius: BorderRadius.circular(15)),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: Opacity(
//                                     opacity: 0.8,
//                                     child: Image.network(
//                                       value.movie.,

//                                       // 'https://images.unsplash.com/photo-1621259045399-9158ddb04e41?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aGQlMjBpbWFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         }
//                         return Container();
//                         // child: Container(
//                         //   height: 210,
//                         //   width: 150,
//                         //   decoration: BoxDecoration(
//                         //       border: Border.all(color: Colors.black38),
//                         //       borderRadius: BorderRadius.circular(15)),
//                         //   child: ClipRRect(
//                         //     borderRadius: BorderRadius.circular(15),
//                         //     child: Opacity(
//                         //       opacity: 0.8,
//                         //       child: Image.network(
//                         //         'https://images.unsplash.com/photo-1621259045399-9158ddb04e41?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aGQlMjBpbWFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//                         //         fit: BoxFit.fill,
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                       }),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
