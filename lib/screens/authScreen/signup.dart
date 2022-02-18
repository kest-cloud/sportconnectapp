// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportconnectapp/screens/authScreen/email_verification.dart';
import 'package:sportconnectapp/screens/authScreen/verify_phone_num.dart';

import 'package:sportconnectapp/widgets/input.dart';

import '../../helper/auth.dart';
import '../../utils/responsive.dart';
import '../../widgets/button.dart';
import '../home.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController emaillController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController confirmPasswordController = new TextEditingController();
TextEditingController phoneeNumController = new TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // final firebaseUser = context.watch<User>();
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        // height: 50,
        padding: EdgeInsets.all(20),
        color: theme.cardColor,
        child: Column(
          children: [
            SizedBox(height: getResponsiveHeight(context: context, height: 10)),
            _SignUpTitle(),
            CustomInput(
              controller: emaillController,
              text: "Email",
              icon: Icons.email,
            ),
            CustomInput(
              textt: TextInputType.visiblePassword,
              controller: passwordController,
              text: "Password",
              icon: Icons.lock,
              secure: true,
            ),
            CustomInput(
              textt: TextInputType.visiblePassword,
              controller: confirmPasswordController,
              text: "Confirm Password",
              icon: Icons.lock,
              secure: true,
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: getResponsiveHeight(context: context, height: 3)),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    text: "Sign Up",
                    onPress: () {
                      final email = emaillController.text;
                      final password = passwordController.text;
                      final cpassword = confirmPasswordController.text;

                      if (email.isEmpty) {
                        SnackBar(content: Text("Please enter Email"));
                      } else {
                        if (password.isEmpty) {
                          SnackBar(content: Text("Please enter password"));
                        } else {
                          if (password != cpassword) {
                            SnackBar(content: Text("Password doesn't match"));
                          } else {
                            context.read<AuthenticationService>().signUp(
                                  email: email,
                                  password: password,
                                );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyEmailScreen()),
                            );
                          }
                        }
                      }
                    },
                  ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('Or Sign Up with Phone Number'),
            SizedBox(height: 10),
            CustomInput(
              textt: TextInputType.number,
              controller: phoneeNumController,
              text: "Phone Number",
              icon: Icons.lock,
              secure: false,
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: getResponsiveHeight(context: context, height: 3)),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    text: "Sign Up",
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyPhoneNumberScreen(
                                  phone: phoneeNumController.text,
                                )),
                      );
                    },
                  ))
                ],
              ),
            ),
            _SignUpBase(),
          ],
        ),
      ),
    );
  }
}

class _SignUpTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (Container(
      margin: EdgeInsets.only(
          bottom: getResponsiveHeight(context: context, height: 3)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Welcome, Please Sign Up",
          style: theme.textTheme.headline4,
        ),
      ),
    ));
  }
}

class _SignUpBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (Container(
      margin: EdgeInsets.only(
          bottom: getResponsiveHeight(context: context, height: 3)),
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          },
          child: Text(
            "I've an account already? Sign In",
            style: theme.textTheme.caption,
          ),
        ),
      ),
    ));
  }
}
