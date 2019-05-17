import 'package:flutter/material.dart';
class NavigationHelper{
  static void push(BuildContext context, Widget page){
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  static void pop(BuildContext context){
    Navigator.of(context).pop();
  }
}