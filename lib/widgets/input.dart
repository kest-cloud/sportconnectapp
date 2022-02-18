import 'package:flutter/material.dart';

import '../utils/responsive.dart';

int inputBg = 0xFF181829;
int inputText = 0xFF65656B;

class CustomInput extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool secure;
  TextEditingController controller;
  final TextInputType textt;
  // final Function onChanged;
  //i will come back here to add a controller so that I can check m text...

  CustomInput({
    required this.text,
    this.textt = TextInputType.emailAddress,
    this.secure = false,
    required this.controller,
    this.icon = Icons.email,
    // required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (Container(
      margin: EdgeInsets.only(
          bottom: getResponsiveHeight(context: context, height: 3)),
      child: TextField(
        controller: controller,
        keyboardType: textt,
        obscureText: secure,
        style: theme.textTheme.caption,
        decoration: InputDecoration(
            fillColor: Color(inputBg),
            prefixIcon: Icon(icon),
            filled: true,
            hintText: text,
            // ignore: prefer_const_constructors
            contentPadding: EdgeInsets.all(22),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none),
            hintStyle: TextStyle(color: Color(inputText))),
      ),
    ));
  }
}
