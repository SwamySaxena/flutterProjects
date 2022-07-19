import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptiveFlateButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  AdaptiveFlateButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                          ? CupertinoButton(
                            onPressed: onPressed,
                              child: Text(
                                "Choose a Date!",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                          )
                          : FlatButton(
                              textColor: Theme.of(context).primaryColor,
                              onPressed: onPressed,
                              child: Text(
                                "Choose a Date!",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ));
  }
}