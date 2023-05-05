import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/core/router.gr.dart';
import 'package:flutter_movie_application/movies/presentation/screens/bookmarked_movies.dart';
import 'package:flutter_movie_application/movies/presentation/screens/login_screen.dart';
import 'package:flutter_movie_application/movies/presentation/widgets/profile_menu.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=',
                          fit: BoxFit.fill,
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              const Text('Pramod Timilsina',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 8),

              const Text('timilsinapramod8888@gmail.com',
                  style: TextStyle(color: Colors.white)),
              const SizedBox(height: 13),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(const BookMarkedRoute());
                    // pushRoute(const BookMarkedRoute());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text('Update Profile',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                  title: "Settings",
                  textColor: Colors.white,
                  icon: Icons.settings,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "BookMarks",
                  textColor: Colors.white,
                  icon: Icons.bookmarks,
                  onPress: () {
                    // context.router.push(const BookMarkedRoute());
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BookMarkedScreen(),
                      ),
                    );
                  }),
              ProfileMenuWidget(
                title: "Movies",
                textColor: Colors.white,
                icon: Icons.verified_user,
                onPress: () {},
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              // ProfileMenuWidget(
              //     title: "Information", icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(
                title: "Logout",
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
