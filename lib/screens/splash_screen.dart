// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sportconnectapp/layout.dart';
import 'package:sportconnectapp/screens/authScreen/login.dart';
import 'package:sportconnectapp/screens/authScreen/login.dart';
import 'package:sportconnectapp/screens/authScreen/signup.dart';

import '../utils/responsive.dart';
import '../widgets/button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (AppLayout(
        child: SingleChildScrollView(
      child: Column(
        children: [SplashImage(), SplashContent(), SplashButtons()],
      ),
    )));
  }
}

class SplashImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getResponsiveHeight(context: context, height: 35),
      padding: EdgeInsets.only(
          bottom: getResponsiveHeight(context: context, height: 10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Image.asset(
            'assets/images/messicr7.jpg',
          ))
        ],
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    num screenWidth = getScreenWidth(context);

    return (Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: screenWidth / 1.5,
          child: Column(children: [
            Text(
              "Discover Buddies who love same Sport as you",
              style: theme.textTheme.headline2,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "You get to meet buddies who love the sport you love here,  does this sound great? Sign Up now to Register? if you have then Sign In.",
                style: theme.textTheme.caption,
              ),
            ),
          ]),
        )));
  }
}

class SplashButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: EdgeInsets.only(
          top: getResponsiveHeight(context: context, height: 4.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_Button1(), _Button2()],
      ),
    ));
  }
}

class _Button1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Expanded(
        child: SizedBox(
            height: 60,
            child: CustomButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              text: "Sign in",
            ))));
  }
}

class _Button2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Expanded(
        child: SizedBox(
            height: 60,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(color: Color(0xFFC4C4C4), fontSize: 16),
                )))));
  }
}
