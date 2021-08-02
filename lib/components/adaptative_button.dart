import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            color: Theme.of(context).buttonColor,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).buttonColor),
              foregroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
            child: Text(label),
            onPressed: onPressed,
          );
  }
}
