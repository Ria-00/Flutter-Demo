
import 'package:ecommerce/model/UserClass.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserOpeartions{

  add(UserClass user){
    FirebaseAuth auth=FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(email: user.email!, password: user.password!);
  }

  login(){

  }

  update(){

  }

  remove(){

  }
}