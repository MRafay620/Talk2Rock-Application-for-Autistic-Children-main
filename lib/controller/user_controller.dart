import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends ChangeNotifier {
  String? email;
  String? password;
  bool isLoading = false;
  GoogleSignInAccount? get googleAccount => _googleAccount;
  GoogleSignInAccount? _googleAccount;

  // Other properties and methods for signup and login

  // Google signin
  Future<void> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final account = await googleSignIn.signIn();
      setGoogleAccount(account);
      if (account != null) {
        final auth = await account.authentication;
        // Get the accessToken and idToken from the authentication object
        final accessToken = auth.accessToken;
        final idToken = auth.idToken;

        // Use the accessToken and idToken for Firebase Auth sign-in
        // For example:
        final authResult = await FirebaseAuth.instance.signInWithCredential(
        GoogleAuthProvider.credential(
            accessToken: accessToken,
             idToken: idToken,
           ),
         );
        // Handle the auth result as needed
      }
    } catch (error) {
      // Handle login error
    }
  }
  // Update the googleAccount value
  void setGoogleAccount(GoogleSignInAccount? account) {
    _googleAccount = account;
    notifyListeners();
  }
  // Define the logout method
  void logout() {
    // Perform logout logic here
    // For example, sign out from Firebase Auth and Google Sign-In
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    setGoogleAccount(null); // Update the googleAccount value to null
  }
}
