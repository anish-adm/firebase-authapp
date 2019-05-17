import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_authapp/ui/components/firebase_auth_app.dart';

void main() {
  return runApp(EasyLocalization(child: FirebaseAuthApp()));
}
