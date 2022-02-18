// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sportconnectapp/layout.dart';
import 'package:sportconnectapp/utils/responsive.dart';

class BuddiesScreen extends StatefulWidget {
  BuddiesScreen({Key? key}) : super(key: key);

  @override
  State<BuddiesScreen> createState() => _BuddiesScreenState();
}

class _BuddiesScreenState extends State<BuddiesScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (AppLayout(
        showBottomNav: true,
        currentIndex: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getResponsiveHeight(context: context, height: 100),
                padding: EdgeInsets.all(20),
                color: theme.cardColor,
                child: Column(
                  children: [
                    // SizedBox(
                    //     height:
                    //         getResponsiveHeight(context: context, height: 30)),

                    Center(
                      child: Container(
                          child: Column(
                        children: [
                          Text('Buddies'),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
