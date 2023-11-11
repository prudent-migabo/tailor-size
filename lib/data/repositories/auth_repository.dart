import 'package:avec/data/data.dart';
import 'package:avec/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{

  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  Stream<User?> get user=> auth.userChanges();


  // SignOut user
  Future signOutUser () async{
    await auth.signOut();
  }

}