// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  BottomNav({this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    handleTap(int val) {
      switch (val) {
        case 0:
          Navigator.of(context).pushNamed('/home');
          break;
        case 1:
          Navigator.of(context).pushNamed('/profile');
          break;
        case 2:
          Navigator.of(context).pushNamed('/buddies');
          break;
        case 3:
          Navigator.of(context).pushNamed('/discover');
          break;
        case 4:
          Navigator.of(context).pushNamed('/settings');
          break;
      }
    }

    return (BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: theme.cardColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color(0xFF65656B),
      selectedItemColor: Colors.blue,
      // elevation: 5.0,
      onTap: (val) {
        handleTap(val);
      },
      showUnselectedLabels: false,
      selectedLabelStyle: GoogleFonts.sourceSansPro(),
      unselectedLabelStyle: GoogleFonts.sourceSansPro(),
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home_rounded),
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.image_rounded),
          icon: Icon(Icons.image_outlined),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.people_alt_outlined),
          icon: Icon(Icons.people),
          label: "Buddies",
        ),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.compass_calibration_outlined),
            icon: Icon(Icons.compass_calibration),
            label: "Discover"),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings_accessibility_outlined),
            icon: Icon(Icons.settings),
            label: "Settings"),
      ],
    ));
  }
}
