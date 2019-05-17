import 'package:flutter/material.dart';
import 'package:firebase_authapp/ui/colors/colors.dart' as AppColors;
final ThemeData defaultTheme = _buildDefaultTheme();

/*
* ToDo: Write code description
*/
ThemeData _buildDefaultTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColorDark,
    primaryColorLight: AppColors.primaryColorLight,
    accentColor: AppColors.accentColor,
    buttonTheme: ButtonThemeData(
      minWidth: 150,
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.primaryColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
    ),
  );
}