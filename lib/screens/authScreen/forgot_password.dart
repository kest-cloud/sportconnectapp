// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportconnectapp/helper/auth.dart';
import 'package:sportconnectapp/utils/responsive.dart';
import 'package:sportconnectapp/widgets/button.dart';
import 'package:sportconnectapp/widgets/input.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: getResponsiveHeight(context: context, height: 100),
        padding: EdgeInsets.all(20),
        color: theme.cardColor,
        child: Column(
          children: [
            SizedBox(height: getResponsiveHeight(context: context, height: 30)),
            Text("Reset Password"),
            SizedBox(height: 10),
            CustomInput(
              controller: emailController,
              text: "Email",
              icon: Icons.email,
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: getResponsiveHeight(context: context, height: 3)),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    text: "Send Request",
                    onPress: () {
                      final email = emailController.text;
                      if (email.isEmpty) {
                        print('email is emoty');
                      }
                      context
                          .read<AuthenticationService>()
                          .resetPassword(email: emailController.text);

                      Navigator.of(context).pop();
                    },
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
