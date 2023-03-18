import 'package:adg_hackathon/components/affiliation_components/yes_button.dart';
import 'package:adg_hackathon/components/custom_button.dart';
import 'package:adg_hackathon/pages/signup_mahe_page.dart';
import 'package:adg_hackathon/pages/signup_non_mahe_page.dart';
import 'package:flutter/material.dart';

import '../components/affiliation_components/no_button.dart';


class AffiliationPage extends StatelessWidget {
  AffiliationPage({super.key});


  // Callback functions for onTap of buttons:
  void YesButtonClicked() {
    //todo: define this method
  }

  void NoButtonClicked() {
    //todo: define this method
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea (
        child: Center(
          child: Column (
            children: [

              SizedBox(height: 250),

              //Affiliation text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                        "Are you affiliated",
                        style: TextStyle(color: Color(/*0xff283618*/ 0xff000000), fontSize: 35, fontFamily: 'Roboto-Light')
                    )
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                        "with MAHE?",
                        style: TextStyle(color: Color(/*0xff283618*/ 0xff000000), fontSize: 35, fontFamily: 'Roboto-Light')
                    )
                  ],
                ),
              ),

              SizedBox(height: 50),


              // BUTTON TEMPLATE ---------------------------------------------------------------
              // Yes button
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupMahePage()));
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Color(0xffffffff), fontSize: 16, fontFamily: 'Roboto-Light'),
                      )
                    )
                  )
              ),
              // BUTTON TEMPLATE ---------------------------------------------------------------


              SizedBox(height: 20),

              // No button
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupNonMahePage()));
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(color: Color(0xffffffff), fontSize: 16, fontFamily: 'Roboto-Light'),
                          )
                      )
                  )
              ),

            ]
          )
        )
      )
    );


  }

} // end of class