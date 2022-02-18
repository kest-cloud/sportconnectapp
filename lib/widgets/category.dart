// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sportconnectapp/widgets/gradients.dart';

import '../model/categories.dart';
import '../utils/responsive.dart';

List<Cateegory> getCategories() {
  return ([
    Cateegory(
        name: "Soccer",
        imagePath: "assets/images/interests/soccer.png",
        starred: true),
    Cateegory(
        name: "Basketball",
        imagePath: "assets/images/interests/basketball.png"),
    Cateegory(
        name: "Football", imagePath: "assets/images/interests/football.png"),
    Cateegory(
        name: "Baseball", imagePath: "assets/images/interests/baseball.png"),
    Cateegory(name: "Tennis", imagePath: "assets/images/interests/tennis.png"),
    Cateegory(
        name: "Volleyball",
        imagePath: "assets/images/interests/basketball.png"),
  ]);
}

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Cateegory> categories = getCategories();
    return (Container(
      height: 120.0,
      margin: EdgeInsets.only(
          top: getResponsiveHeight(context: context, height: 2),
          bottom: getResponsiveHeight(context: context, height: 2)),
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, pos) {
            return (CategoryCard(
              category: categories[pos],
            ));
          }),
    ));
  }
}

class CategoryCard extends StatelessWidget {
  final Cateegory category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return (Container(
        width: 120,
        margin: EdgeInsets.only(right: 13.0),
        decoration: BoxDecoration(
          gradient: category.starred ? customGradient() : null,
          borderRadius: BorderRadius.circular(10),
          color: theme.cardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              category.imagePath,
              width: 40,
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                category.name,
                style: theme.textTheme.subtitle2,
              ),
            )
          ],
        )));
  }
}
