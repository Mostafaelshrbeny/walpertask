import 'package:firebase_core/firebase_core.dart';

class FirebaseErrorHandler {
  // This method takes a FirebaseException and returns a user-friendly message
  static String handleError(FirebaseException e) {
    String result;

    switch (e.code) {
      case 'permission-denied':
        result = "You do not have permission to access this resource.";
        break;
      case 'not-found':
        result = "The requested resource was not found.";
        break;
      case 'already-exists':
        result = "The resource already exists.";
        break;
      case 'unauthenticated':
        result = "You need to be authenticated to perform this action.";
        break;
      case 'unknown':
        result = "An unknown error occurred. Please try again.";
        break;
      // Add more specific FirebaseException codes as needed
      default:
        result = e.message ?? "An unexpected error occurred: ${e.code}.";
    }

    // Optionally, log the error for further analysis
    //print("FirebaseError: $result");

    return result;
  }
}
