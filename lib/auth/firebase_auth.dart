import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User cancelled
        return null;
      }

      // Get auth details
      final googleAuth = await googleUser.authentication;

      // Create a credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In error: $e");
      return null;
    }
  }
}
