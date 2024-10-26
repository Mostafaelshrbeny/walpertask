import 'package:firebase_auth/firebase_auth.dart';

class AuthErrorHandling {
  static String errorHandle(FirebaseAuthException e) {
    String result = "";

    switch (e.code) {
      case 'invalid-email':
        result = "The email address is badly formatted.";
        break;
      case 'user-not-found':
        result = "No user found for that email.";
        break;
      case 'wrong-password':
        result = "Wrong password provided for that user.";
        break;
      case 'user-disabled':
        result = "The user account has been disabled.";
        break;
      case 'email-already-in-use':
        result = "The email address is already in use by another account.";
        break;
      case 'operation-not-allowed':
        result = "Email/password accounts are not enabled.";
        break;
      case 'weak-password':
        result = "The password is too weak.";
        break;
      case 'too-many-requests':
        result = "Too many unsuccessful login attempts. Try again later.";
        break;
      case 'account-exists-with-different-credential':
        result =
            "An account already exists with a different sign-in credential.";
        break;
      case 'invalid-credential':
        result = "The supplied auth credential is invalid or expired.";
        break;
      case 'requires-recent-login':
        result = "Please log in again to perform this operation.";
        break;
      case 'credential-already-in-use':
        result = "This credential is already associated with another user.";
        break;
      default:
        result = e.message ?? "An unexpected error occurred.";
    }

    return result;
  }
}
