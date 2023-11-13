import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{

  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  Stream<User?> get user=> auth.userChanges();


  Future<void> createUser ({required String email, required String password}) async{
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> loginUser({required String email, required String password}) async{
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // SignOut user
  Future signOutUser () async{
    await auth.signOut();
  }

}