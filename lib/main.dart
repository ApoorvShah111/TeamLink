import 'package:adg_hackathon/junctions/startup_junction.dart';
import 'package:adg_hackathon/pages/affiliation_page.dart';
import 'package:adg_hackathon/pages/login_page.dart';
import 'package:adg_hackathon/pages/signup_mahe_page.dart';
import 'package:adg_hackathon/pages/signup_non_mahe_page.dart';
import 'package:adg_hackathon/pages/splash_screen.dart';
import 'package:flutter/material.dart';

// Flutter dependencies:
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


// main function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Routes to startup-junction (checks if already logged in or not):
      home: Junction_Startup()
    );
  }

}
