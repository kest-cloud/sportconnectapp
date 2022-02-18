// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportconnectapp/helper/auth.dart';
import 'package:sportconnectapp/layout.dart';
import 'package:sportconnectapp/screens/authScreen/login.dart';

import '../utils/responsive.dart';
import '../widgets/category.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (AppLayout(
        showBottomNav: true,
        currentIndex: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _HomeHeading(),
              _HomeHeroImage(),
              CategoryList(),
            ],
          ),
        )));
  }
}

class _HomeHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    ThemeData theme = Theme.of(context);
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Connect Sport Lovers",
          style: theme.textTheme.headline5,
        ),
        Row(
          children: [
            HomeIcons(
              icon: Icons.location_searching_outlined,
            ),
            GestureDetector(
              onTap: () async {
                await context.read<AuthenticationService>().signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                    (route) => false);
              },
              child: HomeIcons(icon: Icons.logout),
            ),
          ],
        )
      ],
    ));
  }
}

class HomeIcons extends StatelessWidget {
  final IconData icon;

  HomeIcons({required this.icon});

  @override
  Widget build(BuildContext context) {
    return (IconButton(
        icon: Icon(icon, color: Colors.white), onPressed: () {}));
  }
}

class _HomeHeroImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: EdgeInsets.only(
          top: getResponsiveHeight(context: context, height: 2),
          bottom: getResponsiveHeight(context: context, height: 2)),
      child: Image.asset(
        'assets/images/cr7.jpg',
      ),
    ));
  }
}
