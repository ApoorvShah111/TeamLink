import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeBottomNavbar extends StatelessWidget {

  void Function(int)? onTabChange;

  HomeBottomNavbar ({
    super.key,
    required this.onTabChange
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: GNav(
          color: Colors.grey,
          activeColor: Colors.black,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.white,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          tabBorderRadius: 30,
      
          onTabChange: (value)=> onTabChange!(value),
          tabs: const [
            GButton(
                icon: Icons.home,
                text: "  Feed",
            ),
            GButton(
              icon: Icons.cases_rounded,
              text: "  Openings",
            ),
            GButton(
              icon: Icons.person,
              text: "  Profile",
            ),
          ],
        ),
      ),
    );
  }

}