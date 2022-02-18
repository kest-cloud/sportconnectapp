// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sportconnectapp/layout.dart';
import 'package:sportconnectapp/utils/responsive.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (AppLayout(
        showBottomNav: true,
        currentIndex: 3,
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
                          Text('Discover'),
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
