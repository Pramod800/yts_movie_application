import 'package:flutter/material.dart';
import 'package:flutter_movie_application/movies/presentation/screens/download_screen.dart';
import 'package:flutter_movie_application/movies/presentation/screens/movies_home_screen.dart';
import 'package:flutter_movie_application/movies/presentation/screens/movies_search_screen.dart';
import 'package:flutter_movie_application/movies/presentation/screens/profile_screen.dart';

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({super.key});

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  int currentIndex = 0;
  void update(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      const HomePageScreen(),
      const MOvieSearchScreen(),
      const DownLoadScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.black38,
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        backgroundColor: const Color.fromARGB(255, 30, 31, 30),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: update,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'home',
          ),
          BottomNavigationBarItem(
            icon: Center(child: Icon(Icons.search)),
            label: 'Search',
            tooltip: 'search',
            // activeIcon: Container(
            //     decoration: BoxDecoration(
            //         color: Theme.of(context).colorScheme.secondary,
            //         borderRadius: BorderRadius.circular(10)),
            //     padding: const EdgeInsets.all(15),
            //     child: Icon(
            //       Icons.search,
            //       color: Theme.of(context).canvasColor,
            //     )),
          ),
          BottomNavigationBarItem(
            icon: Center(child: Icon(Icons.download_sharp)),
            label: 'Downloads',
            tooltip: 'downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
      ),
      body: _children[currentIndex],
    );
  }
}
