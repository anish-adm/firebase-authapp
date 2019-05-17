import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_authapp/bloc/user/user_bloc.dart';
import 'package:firebase_authapp/bloc/user/user_event.dart';
import 'package:firebase_authapp/entities/user.dart';
import 'package:firebase_authapp/utils/navigation_helper.dart';
import 'package:firebase_authapp/ui/colors/colors.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(text: "");
  final TextEditingController _passwordController = TextEditingController(text: "");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserBloc _userBloc = UserBloc();
  void _signUpUser(BuildContext context) async {
    try{
      final FirebaseUser firebaseUser = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (firebaseUser != null) {
        User user = User(token: await firebaseUser.getIdToken(),email: firebaseUser.email);
        _userBloc.dispatch(Login(user));
        NavigationHelper.pop(context);
      }
    } on PlatformException catch (e) {
      if("ERROR_EMAIL_ALREADY_IN_USE" == e.code){
        final snackBar = SnackBar(content: Text(AppLocalizations.of(context).tr('message_email_already_in_use')));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }else{
        final snackBar = SnackBar(content: Text(AppLocalizations.of(context).tr('message_could_not_signup')));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr('label_signup')),
      ),
      body: Container(
        child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(labelText: AppLocalizations.of(context).tr("label_email")),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return AppLocalizations.of(context).tr("message_enter_email");
                                  }
                                },
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: _passwordController,
                                decoration: InputDecoration(labelText: AppLocalizations.of(context).tr("label_password")),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return AppLocalizations.of(context).tr("message_enter_password");
                                  }
                                },
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      _signUpUser(context);
                                    }
                                  },
                                  child: Text(AppLocalizations.of(context).tr("label_signup"),style: TextStyle(color: grayColor)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
