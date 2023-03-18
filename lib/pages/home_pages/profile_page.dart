import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();

} // end of FeedPage class



class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    //String var1 = widget.var1;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 75),

              Icon(
                Icons.account_circle_rounded,
                color: Color.fromARGB(255, 69, 69, 69),
                size: 135

              ),

              SizedBox(height: 25),

              Text(
                "user@gmail.com",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Divider(),
              ),

              SizedBox(height: 35)


            ],
          )
        ),
      )
    );
    
  }



} // end of _FeedPageState class