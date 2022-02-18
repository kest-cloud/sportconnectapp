// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportconnectapp/screens/authScreen/signup.dart';

import '../layout.dart';
import '../utils/responsive.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String uid;
  @override
  initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (AppLayout(
        showBottomNav: true,
        currentIndex: 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getResponsiveHeight(context: context, height: 100),
                padding: EdgeInsets.all(20),
                color: theme.cardColor,
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      radius: 200,
                    ),
                    Container(
                        child: Column(
                      children: [
                        Text("Afolayan Ademola"),
                        Text(uid),
                        SizedBox(height: 10),
                        Text('PhoneNumber: +2349076836529'),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
