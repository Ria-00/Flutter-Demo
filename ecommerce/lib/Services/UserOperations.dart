
import 'dart:async';

import 'package:ecommerce/model/UserClass.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserOpeartions{

  Future<String> add(UserClass user) async{
    FirebaseAuth auth=FirebaseAuth.instance;
    try {
      auth.createUserWithEmailAndPassword(email: user.email!, password: user.password!);
      print("done");
      return "Reg";
    } catch (e) {
      print("no");
      return "no";
    }
    }

  Future<int> login(UserClass user) async{
    FirebaseAuth auth=FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(email: user.email!, password: user.password!);
      print("done");
      return 1;
    } catch (e) {
      print("no");
      return 0;
    }
    }

  update(){

  }

  remove(){

  }
}