
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
//
class Authentication {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signUpUser({
    required String name,
    required String password,
    required String email,
  }) async {
    String result = "Some error occurred";
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await fireStore.collection("users").doc(credential.user!.uid).set({
        'name': name,
        'email': email,
        'uid': credential.user!.uid,
      });

      result = "Success";
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
  //for loginscreen
  Future<String> loginUser({
    required String name,
    required String email,
    required String password,

}) async{
    String result = "Some error occurred";
    try{
    await auth.signInWithEmailAndPassword(email: email, password: password) ;
    result="Success";

    }
    catch(e){
      print(e.toString());
    }
    return result;

  }
  Future<void>signOut() async{
    await auth.signOut();

}
}