import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPress;

  AdaptativeButton(
    this.label,
    this.onPress,
  );

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            child: Text(label),
            onPressed: onPress,
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black87,
            ),
            onPressed: onPress,
            child: Text(
              label,
            ),
          );
  }
}
