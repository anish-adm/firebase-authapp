import 'package:equatable/equatable.dart';
import 'package:firebase_authapp/entities/user.dart';
abstract class UserState extends Equatable{
  User user;
  UserState({this.user}) : super([user]);
}

class UserUndefined extends UserState{
  @override
  String toString() => "UserState: UserUndefined";
}


class UserLoggedIn extends UserState {
  final User user;

  UserLoggedIn(this.user) : super();

  UserLoggedIn copyWith({
    User user,
  }) {
    return UserLoggedIn(this.user);
  }

  @override
  String toString() => "UserState: UserLoggedIn {user: ${user.token} ${user.email} }";
}

class UserLoggedOut extends UserState{
  @override
  String toString() => "UserState: UserLoggedOut";
}