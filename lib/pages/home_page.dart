import 'package:adg_hackathon/components/bottom_navbar.dart';
import 'package:adg_hackathon/pages/home_pages/feed_page.dart';
import 'package:adg_hackathon/pages/home_pages/openings_page.dart';
import 'package:adg_hackathon/pages/home_pages/profile_page.dart';
import 'package:adg_hackathon/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String var1;
  HomePage({
    super.key,required this.var1
  });
  @override
  State<HomePage> createState() => _HomePageState();
} // end of HomePage class


class _HomePageState extends State<HomePage> {

  int SelectedIndex = 0;
  String pass='';

  //this gets the current user
  final user =  FirebaseAuth.instance.currentUser;

  void NavigateBottomBar(int index) {
    setState(() {
      SelectedIndex = index;
    });
  }

  void SetUID(String UID){
    final pass= UID;
  }
  
  final List<Widget> _pages = [
    const FeedPage(),
    const OpeningsPage(),
    const ProfilePage()
  ];

  

  @override
  Widget build(BuildContext context) {

    final String var1 = widget.var1;
    
    SetUID(var1);
    // TODO: FILL THIS FUNCTION OUT ------------------------------------------------
    void Signout() {

      // logout logic of firebase
      try{
        //signin command
        FirebaseAuth.instance.signOut();


        //Navigating to the login page
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
        
      } on FirebaseAuthException catch (e) {

        //showing the error
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                backgroundColor: Colors.black,
                title: Center(
                  child: Text(
                    'Error in signing out, try again!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            });

      }

    }



    return WillPopScope(
        onWillPop: () => Future.value(false),

        child: Scaffold(
          backgroundColor: Color(0xffffffff),
          bottomNavigationBar: HomeBottomNavbar(
            onTabChange: (index) => NavigateBottomBar(index),
          ),

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
          ),

          drawer: Drawer(
              backgroundColor: Colors.black.withAlpha(230),
              child: Column(
                children: [
                  SizedBox(height: 150),

                  Text(
                    'TeamLink',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: 'Roboto-Light'),
                  ),

                  SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.grey[900],
                      thickness: 1,
                    ),
                  ),

                  SizedBox(height: 50),

                  // Home icon and text in the drawer
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Roboto-Light'),
                      ),
                    ),
                  ),

                  // Settings icon and text in the drawer
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Roboto-Light'),
                      ),
                    ),
                  ),

                  SizedBox(height: 400),

                  // Log Out icon and text in the drawer
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Log Out",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Roboto-Light'),
                          ),

                          // TODO: WORK ON THIS: ------------------------------------------------------------
                          onTap: () {
                            Signout();
                          },


                        ),
                      )

                  )
                ],
              )
          ),

          body: _pages[SelectedIndex],

        )
    );
  }
} // end of _HomePageState class
