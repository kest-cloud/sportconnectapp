import 'package:flutter/material.dart';

import '../layout.dart';
import '../utils/responsive.dart';
import '../widgets/button.dart';
import '../widgets/sport_list_interest.dart';

class InterestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (AppLayout(
        child: Column(
      children: [
        _InterestTitle(),
        _InterestSubtitle(),
        InterestList(),
        _InterestButton()
      ],
    )));
  }
}

class _InterestTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (Container(
        margin: EdgeInsets.only(
            top: getResponsiveHeight(context: context, height: 2),
            bottom: getResponsiveHeight(context: context, height: 2)),
        child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                width: getResponsiveWidth(context: context, width: 65),
                child: Text(
                  "What Sport Interest You?",
                  style: theme.textTheme.headline3,
                )))));
  }
}

class _InterestSubtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "You can choose more than one",
          style: theme.textTheme.caption,
        ),
      ),
    ));
  }
}

class _InterestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    handleContinue() {
      Navigator.of(context).pushNamed('/home');
    }

    return (Column(
      children: [
        ExpandedWidth(
            child: CustomButton(
          onPress: () {
            handleContinue();
          },
          text: "Continue",
        )),
        ExpandedWidth(
            child: CustomFlatButton(
          text: "Skip",
          onPress: () {
            handleContinue();
          },
        ))
      ],
    ));
  }
}
