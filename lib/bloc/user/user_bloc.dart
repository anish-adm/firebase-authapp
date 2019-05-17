import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:firebase_authapp/bloc/user/user_event.dart';
import 'package:firebase_authapp/bloc/user/user_state.dart';
import 'package:firebase_authapp/model/user_model.dart';
import 'package:firebase_authapp/utils/db_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_authapp/entities/user.dart';
class UserBloc extends Bloc<UserEvent,UserState>{

  //Create Singleton
  static final UserBloc _userBloc = new UserBloc._internal();
  factory UserBloc() {
    return _userBloc;
  }
  UserBloc._internal();

  @override
  UserState get initialState => UserUndefined();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is Check){
      Database db = await DBProvider().database;
      User userWithID = await UserModel(db).getFirstUser();
      if(userWithID == null){
        yield UserLoggedOut();
      }else{
        yield UserLoggedIn(userWithID);
      }
    }
    if (event is Login){
      try{
        Database db = await DBProvider().database;
        User userWithID = await UserModel(db).insert(event.user); //insert onto local
        if(userWithID != null){
          yield UserLoggedIn(userWithID);
        }else{
          yield UserLoggedOut();
        }
      }catch(error){
        yield UserLoggedOut();
      }
    }
    if(event is Logout){
      try{
        Database db = await DBProvider().database;
        int deletedCount =  await UserModel(db).delete(event.user.id);
        yield UserLoggedOut();
      }catch(error){
        //ToDo: Write log
      }
    }
  }

  @override
  void onTransition(Transition<UserEvent, UserState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}