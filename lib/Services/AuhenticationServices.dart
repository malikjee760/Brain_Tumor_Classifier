import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Auth_Service{

  final FirebaseAuth _auth =FirebaseAuth.instance;


  Future createAccount(String email ,String password) async{
    try{
      var auth = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return auth.user;

    } catch(e){
      print(e.toString());

    }
  }


  Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }



  Future SignIn(String email ,String password) async{
    try{
      var result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;

    } catch(e){
      print(e.toString());

    }
  }

  Future resetPassword(String email) async{

      var reset = await _auth.sendPasswordResetEmail(email: email,);
      return reset;
  }

  void signOut(){
    _auth.signOut();
  }
}

