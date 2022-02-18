// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sportconnectapp/screens/authScreen/signup.dart';
import 'package:sportconnectapp/widgets/button.dart';
import 'package:sportconnectapp/widgets/input.dart';

import '../layout.dart';
import '../utils/responsive.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController updatePasswordController = TextEditingController();
    TextEditingController updateEmailController = TextEditingController();
    TextEditingController updateUsernameController = TextEditingController();

    ThemeData theme = Theme.of(context);
    return (AppLayout(
        showBottomNav: true,
        currentIndex: 4,
        child: Container(
            height: getResponsiveHeight(context: context, height: 100),
            padding: EdgeInsets.all(20),
            color: theme.cardColor,
            child: Column(
              children: [
                SizedBox(
                    height: getResponsiveHeight(context: context, height: 30)),
                Text('Update Profile Here'),
                SizedBox(height: 10),
                Text('Change Password'),
                CustomInput(
                  textt: TextInputType.phone,
                  controller: updatePasswordController,
                  text: "New Password",
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
                        text: "Update Password",
                        onPress: () {},
                      ))
                    ],
                  ),
                ),
                // SizedBox(height: 10),
                // Row(
                //   children: [
                //     Text('Update Email'),
                //     CustomInput(
                //       textt: TextInputType.emailAddress,
                //       controller: updateEmailController,
                //       text: "New Email",
                //       icon: Icons.lock,
                //       secure: false,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10),
                // Container(
                //   margin: EdgeInsets.only(
                //       bottom:
                //           getResponsiveHeight(context: context, height: 3)),
                //   child: Row(
                //     children: [
                //       Expanded(
                //           child: CustomButton(
                //         text: "Update Email",
                //         onPress: () {},
                //       ))
                //     ],
                //   ),
                // ),
                // SizedBox(height: 10),
                // Row(
                //   children: [
                //     Text('Update Email'),
                //     CustomInput(
                //       textt: TextInputType.emailAddress,
                //       controller: updateUsernameController,
                //       text: "New Username",
                //       icon: Icons.lock,
                //       secure: false,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10),
                // Container(
                //   margin: EdgeInsets.only(
                //       bottom:
                //           getResponsiveHeight(context: context, height: 3)),
                //   child: Row(
                //     children: [
                //       Expanded(
                //           child: CustomButton(
                //         text: "Update Username",
                //         onPress: () {},
                //       ))
                //     ],
                //   ),
                // ),
                SizedBox(height: 10),
                Text('Log out'),
              ],
            ))));
  }
}
