import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_authapp/ui/theme/app_theme.dart';
import 'package:firebase_authapp/ui/components/login/login.dart';
import 'package:firebase_authapp/bloc/user/user_bloc.dart';
import 'package:firebase_authapp/bloc/user/user_state.dart';
import 'package:firebase_authapp/ui/components/dashboard/dashboard.dart';
import 'package:firebase_authapp/bloc/user/user_event.dart' as UserEvent;
import 'package:firebase_authapp/ui/components/loading/Loading.dart';

class FirebaseAuthApp extends StatefulWidget {
  @override
  _FirebaseAuthAppState createState() => _FirebaseAuthAppState();
}

class _FirebaseAuthAppState extends State<FirebaseAuthApp> {
  UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    userBloc.dispatch(UserEvent.Check());
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Firebase Auth",
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          //app-specific localization
          EasylocaLizationDelegate(
              locale: data.locale ?? Locale('en'), path: 'assets/langs'),
        ],
        supportedLocales: [Locale('en'), Locale('fr')],
        locale: data.locale,
        theme: defaultTheme,
        home: BlocBuilder(
            bloc: userBloc,
            builder: (BuildContext context, UserState userState) {
              if (userState is UserLoggedIn) {
                return Dashboard();
              } else if (userState is UserUndefined) {
                return Loading();
              } else {
                return Login();
              }
            }),
      ),
    );
  }

  @override
  void dispose() {
    userBloc.dispose();
  }
}
