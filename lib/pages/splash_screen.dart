import 'package:flutter/material.dart';

// main function
void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //Change
      body: const SafeArea(
          child: Center(


          )
      )


    );
  }

}