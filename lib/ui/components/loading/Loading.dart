import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(AppLocalizations.of(context).tr('label_loading')),
        ),
      ),
    );
  }
}
