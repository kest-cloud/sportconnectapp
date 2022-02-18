// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportconnectapp/model/interest.dart';
import 'package:sportconnectapp/screens/authScreen/forgot_password.dart';
import 'package:sportconnectapp/screens/authScreen/signup.dart';
import 'package:sportconnectapp/screens/authScreen/verify_phone_num.dart';
import 'package:sportconnectapp/screens/interest.dart';

import 'package:sportconnectapp/widgets/input.dart';
import '../../helper/auth.dart';
import '../../utils/responsive.dart';
import '../../widgets/button.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    ThemeData theme = Theme.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: getResponsiveHeight(context: context, height: 100),
        padding: EdgeInsets.all(20),
        color: theme.cardColor,
        child: Column(
          children: [
            SizedBox(height: getResponsiveHeight(context: context, height: 10)),
            _LoginTitle(),
            CustomInput(
              controller: emailController,
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
            _LoginRemember(),
            Container(
              margin: EdgeInsets.only(
                  bottom: getResponsiveHeight(context: context, height: 3)),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    text: "Sign In",
                    onPress: () {
                      final email = emailController.text;
                      final password = passwordController.text;

                      if (email.isEmpty) {
                        SnackBar(content: Text("Please enter password"));
                      } else {
                        if (password.isEmpty) {
                          SnackBar(content: Text("Please enter password"));
                        } else if (firebaseUser != null) {
                          SnackBar(content: Text("Signing in"));
                          context.read<AuthenticationService>().signIn(
                                email: email,
                                password: password,
                              );
                        }
                        SnackBar(content: Text("Welcome Back"));
                        Navigator.of(context).pushNamed('/home');
                      }
                    },
                  ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('You can also Sign In with Phone Number'),
            SizedBox(height: 10),
            CustomInput(
              textt: TextInputType.phone,
              controller: phoneNumberController,
              text: "Phone Number",
              icon: Icons.lock,
              secure: false,
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(
                  bottom: getResponsiveHeight(context: context, height: 3)),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    text: "Sign In With Phone Number",
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyPhoneNumberScreen(
                                  phone: phoneNumberController.text,
                                )),
                      );
                    },
                  ))
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPassword(),
                    ),
                  );
                },
                child: _LoginBase())
          ],
        ),
      ),
    ));
  }
}

class _LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (Container(
      margin: EdgeInsets.only(
          bottom: getResponsiveHeight(context: context, height: 3)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Sign In",
          style: theme.textTheme.headline4,
        ),
      ),
    ));
  }
}

class _LoginRemember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (Container(
      margin: EdgeInsets.only(
          bottom: getResponsiveHeight(context: context, height: 3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(value: true, onChanged: (_) {}),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Remember me",
                  style: theme.textTheme.caption,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotPassword(),
                ),
              );
            },
            child: Text(
              "Forgot password",
              style: theme.textTheme.caption,
            ),
          )
        ],
      ),
    ));
  }
}

// class _LoginButton extends StatelessWidget {
//   final String email;
//   final String password;

//   const _LoginButton({
//     Key? key,
//     required this.email,
//     required this.password,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     return
//   }
// }

class _LoginBase extends StatelessWidget {
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
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          child: Text(
            "Don’t have account? Sign Up",
            style: theme.textTheme.caption,
          ),
        ),
      ),
    ));
  }
}
