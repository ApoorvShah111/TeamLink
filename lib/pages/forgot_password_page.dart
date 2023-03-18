import 'package:flutter/material.dart';

import '../components/text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final emailController = TextEditingController();

  // Callback methods for buttons:
  void RegisterUser() {
    //todo: define this method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        // TODO: Create forgot password page
        body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 150),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                            "Reset Password",
                            style: TextStyle(color: Color(/*0xff283618*/ 0xff000000), fontSize: 35, fontFamily: 'Roboto-Light')
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 75),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                            "Enter your registered email address",
                            style: TextStyle(color: Color(0xff696969), fontSize: 16, fontFamily: 'Roboto-Light')
                        ),

                        SizedBox(height: 2),

                        Text(
                            "to receive your recovery link",
                            style: TextStyle(color: Color(0xff696969), fontSize: 16, fontFamily: 'Roboto-Light')
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 25),

                  // Email Text field:
                  InputTextField(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false
                  ),


                  SizedBox(height: 50),

                  // Send recovery link Button
                  Padding (
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: ElevatedButton (
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
                                //TODO: Verify email and send recovery link to given email
                                //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                              },
                              child: const Text(
                                "Receive link",
                                style: TextStyle(color: Color(0xffffffff), fontSize: 16, fontFamily: 'Roboto-Light'),
                              )
                          )
                      )
                  )

                ],
              )
            )
        )
    );

  }

}