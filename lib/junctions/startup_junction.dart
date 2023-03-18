import 'package:adg_hackathon/pages/home_page.dart';
import 'package:adg_hackathon/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Junction_Startup extends StatelessWidget{
  Junction_Startup({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If user is logged in, route to HomePage
          //if (snapshot.hasData) {
            
            //return HomePage();
          
          //}
          // Else, route to LoginPage
          //else {
            return LoginPage();
          //}
        },
      ),
    );


  }

}
