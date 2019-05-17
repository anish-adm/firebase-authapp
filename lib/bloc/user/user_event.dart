import 'package:equatable/equatable.dart';
import 'package:firebase_authapp/entities/user.dart';
abstract class UserEvent extends Equatable{}

class Check extends UserEvent{
  @override
  String toString() => "UserEvent: Check";
}

class Login extends UserEvent{
  final User user;
  Login(this.user): super();
  @override
  String toString() => "UserEvent: Login";
}

class Logout extends UserEvent{
  final User user;
  Logout(this.user): super();
  @override
  String toString() => "UserEvent: Logout";
}