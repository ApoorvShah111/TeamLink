import 'package:adg_hackathon/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../components/custom_button.dart';
import '../components/signup_components/signup_button.dart';
import '../components/text_field.dart';

class SignupMahePage extends StatefulWidget {
  SignupMahePage({super.key});

  @override
  State<SignupMahePage> createState() => _RegisterPageState1();
}

class _RegisterPageState1 extends State<SignupMahePage> {
  // The controllers responsible for the email and password text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Callback methods for buttons:
  void RegisterUser1() async {
    //todo: define this method
    //showing the loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    if (!arePasswordsSame(
        passwordController.text, confirmPasswordController.text)) {
      //popping the loading circle
      Navigator.pop(context);
      confirmPasswordMessage();
    } else {
      if (!isEmailValid(emailController.text)) {
        //popping the loading circle
        Navigator.pop(context);
        invalidEmailMessage();
      } else {
        if (!emailController.text.endsWith('.manipal.edu')) {
          Navigator.pop(context);
          MAHEEmailMessage();
        } else {
          try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );

            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
            final FirebaseAuth auth = FirebaseAuth.instance;
            final User? user = auth.currentUser;
            final uid;

            if (user != null) {
              uid = user.uid;

              //TODO:Push the UID to the database
              FirebaseDatabase database = FirebaseDatabase.instance;

              DatabaseReference ref =
                  FirebaseDatabase.instance.ref("MAHE/STUDENT/");
              await ref.set({uid: {}});

              ref = FirebaseDatabase.instance.ref("MAHE/STUDENT/" + uid);
              await ref.set({
                "id": uid,
                "email": emailController.text,
                "name": "NULL",
                "college": "NULL",
                "branch": "NULL",
                "semester": "NULL"
              });
            }

            FirebaseAuth.instance.signOut();

            //popping the loading circle
            Navigator.pop(context);

            // TODO: ADD INTO FIREBASE PROFILE ID (PRIMARY KEYS) #############################################################

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          } on FirebaseAuthException catch (e) {
            //popping the loading circle
            Navigator.pop(context);
            ExceptionMoment(e.code);
          }
        }
      }
    }
  }

  //printing exception
  void ExceptionMoment(String ex) {
    if (ex == 'email-already-in-use') {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.black,
              title: Center(
                child: Text(
                  'There is already account linked with this email',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          });
    } else if (ex == 'weak-password') {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.black,
              title: Center(
                child: Text(
                  'Password is too weak!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          });
    }
  }

  //checking if the email is valid
  bool isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool arePasswordsSame(String p1, String p2) {
    return p1 == p2;
  }

//function to manage invalid email
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

  void MAHEEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                'Make sure the email used is a MAHE email',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  void confirmPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                'The passwords do not match',
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
                child: Column(children: [
          // Add a padding from top:
          const SizedBox(height: 100),

          // Sign In Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Create account",
                    style: TextStyle(
                        color: Color(/*0xff283618*/ 0xff000000),
                        fontSize: 35,
                        fontFamily: 'Roboto-Light')),
              ],
            ),
          ),

          // Padding between Sign In and Email Field
          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Register with your college email address",
                    style: TextStyle(
                        color: Color(0xff696969),
                        fontSize: 16,
                        fontFamily: 'Roboto-Light')),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Email Text field:
          InputTextField(
              controller: emailController,
              hintText: "University Email",
              obscureText: false),

          const SizedBox(height: 20),

          // Password Text Field:
          InputTextField(
            controller: passwordController,
            hintText: "New Password",
            obscureText: true,
          ),

          const SizedBox(height: 25),

          // Confirm Password Text Field:
          InputTextField(
            controller: confirmPasswordController,
            hintText: "Confirm Password",
            obscureText: true,
          ),

          const SizedBox(height: 25),

          //TODO: Change to an elevated button
          // The Register Button:
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
                        RegisterUser1();
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: const Text(
                        "Register",
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
                    "Already have an account?",
                    style: TextStyle(color: Color(0xff6c6c6c)),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                          // TODO: WRAP THIS IN A BUTTON (Gesture detection) TO HANDLE TRANSITION TO "AFFILIATION" PAGE
                          "Sign in",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontFamily: 'Roboto-Bold'))
                      // Register Text

                      )
                ],
              ))
        ]))));
  }
}
