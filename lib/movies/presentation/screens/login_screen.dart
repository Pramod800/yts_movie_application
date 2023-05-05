import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYzwzpnOXSENv9N50nqx0p-ZkcoMRxcd5iJw&usqp=CAU",
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                const Center(
                    child: Text(
                  "Login Page",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                )),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Username",
                    hintText: "Enter Username",
                    prefixIcon: Icon(
                      Icons.verified_user,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Password",
                    hintText: "Enter Password",
                    prefixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // login(emailController.text.toLowerCase(),
                      //     passwordController.text.toString);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(),
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Text("Don't have an account? "),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {},
                        child: Image.network(
                            'https://banner2.cleanpng.com/20201008/rtv/transparent-google-suite-icon-google-icon-5f7f985ccd60e3.5687494416021975968412.jpg',
                            height: 50,
                            width: 60)),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/f/f2/Logo_Twitter.png',
                          height: 50,
                          width: 60),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Image.network(
                            'https://cdn3.iconfinder.com/data/icons/free-social-icons/67/facebook_circle_color-512.png',
                            height: 50,
                            width: 60)
                        //  Image.asset('assets/images/twitter.png',
                        //     height: 50, width: 60),
                        ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
