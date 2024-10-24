import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../providers/current_screen_provider.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // custom bottom navigation bar component
    return GNav(
        backgroundColor: Colors.grey.shade300,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        rippleColor: Colors.grey.shade300,
        tabBorderRadius: 28.0,
        onTabChange: (value) {
          // Update the current screen index in the provider
          Provider.of<CurrentScreenProvider>(context, listen: false)
              .changeScreen(value);
        },
        tabBackgroundColor: Colors.white,
        activeColor: Colors.grey[800],
        tabs: const [
          GButton(
            textColor: Colors.black,
            iconColor: Colors.black,
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            textColor: Colors.black,
            iconColor: Colors.black,
            icon: Icons.favorite,
            text: "Favorite",
          ),
        ]);
  }
}
