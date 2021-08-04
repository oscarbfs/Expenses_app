import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) onSubmitted;

  AdaptativeTextField({
    required this.label,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: onSubmitted,
              placeholder: label,
              style: TextStyle(color: Colors.cyanAccent),
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: onSubmitted,
            style: TextStyle(color: Colors.cyanAccent),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
              enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.purpleAccent)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purpleAccent),
              ),
            ),
          );
  }
}
