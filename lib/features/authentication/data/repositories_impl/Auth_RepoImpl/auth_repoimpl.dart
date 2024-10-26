import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallpapertask/features/authentication/domain/repositories/auth_repo/auth_repo.dart';

class AuthRepoimpl implements AuthRepo {
  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }
}
