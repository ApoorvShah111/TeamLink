
import 'package:adg_hackathon/components/custom_button.dart';
import 'package:adg_hackathon/components/text_field.dart';
import 'package:adg_hackathon/pages/affiliation_page.dart';
import 'package:adg_hackathon/pages/forgot_password_page.dart';
import 'package:adg_hackathon/pages/home_page.dart';
import 'package:adg_hackathon/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:convert';
import 'dart:async';



class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // The controllers responsible for the email and password text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Function to check if the email is valid
  bool isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  // Callback methods for buttons:
  void SignUserIn() async {
    //showing the loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    if (!isEmailValid(emailController.text)) {
      //popping the loading circle
      Navigator.pop(context);
      invalidEmailMessage();
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      String ID = 'buefibf';

      //popping the loading circle
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(var1:ID)));
    } on FirebaseAuthException catch (e) {
      //popping the loading circle
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  //function for wrong email exception
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                'Email does not exist, please try again!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  void invalidEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                'Please enter a valid email address',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  //function for wrong password exception
  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                'Wrong Password, please try again!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            // Add a padding from top:
            const SizedBox(height: 100),

            // TODO: !!!!!!!!!!!!!!
            // Sign In Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Sign in",
                      style: TextStyle(
                          color: Color(/*0xff283618*/ 0xff000000),
                          fontSize: 35,
                          fontFamily: 'Roboto-Light')),
                ],
              ),
            ),

            // Padding between Sign In and Email Field
            const SizedBox(height: 50),

            // Email Text field:
            InputTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(height: 20),

            // Password Text Field:
            InputTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // Forgot Password text and button:
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Forgot password gesture detection
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },

                        // Forgot password text
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Color(0xff6c6c6c)),
                        ))
                  ],
                )),

            const SizedBox(height: 25),

            // The Sign In Button:
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.grey,
                          shadowColor: Colors.grey,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          //minimumSize: Size(100, 40),
                        ),
                        onPressed: () {
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                          SignUserIn();
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 16,
                              fontFamily: 'Roboto-Light'),
                        )))),

            const SizedBox(height: 75),

            // Forgot Password text and button:
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New User?",
                      style: TextStyle(color: Color(0xff6c6c6c)),
                    ),

                    const SizedBox(width: 4),

                    // Gesture detection for the Register-Button
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AffiliationPage();
                              },
                            ),
                          );
                        },

                        // Register Text
                        child: const Text("Register",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontFamily: 'Roboto-Bold')))
                  ],
                ))
          ],
        ))));
  }

/*  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

 */
}
