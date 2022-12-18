import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final Function(String) onSubmitted;

  AdaptativeTextField(
      this.controller, this.keyBoardType, this.onSubmitted, this.label);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            keyboardType: keyBoardType,
            onSubmitted: onSubmitted,
            placeholder: label,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          )
        : TextField(
            controller: controller,
            keyboardType: keyBoardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
