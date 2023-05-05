

// import 'package:flutter/material.dart';
// import 'package:flutter_movie_application/movies/presentation/provider/movies_provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class MovieHomeScreen extends StatefulWidget {
//   const MovieHomeScreen({super.key});

//   @override
//   State<MovieHomeScreen> createState() => _MovieHomeScreenState();
// }

// class _MovieHomeScreenState extends State<MovieHomeScreen> {
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
