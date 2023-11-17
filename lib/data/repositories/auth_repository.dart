import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    await FirebaseFirestore.instance.clearPersistence();
  }


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}