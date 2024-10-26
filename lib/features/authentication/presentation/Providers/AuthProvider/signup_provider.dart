import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpapertask/wallpapers/core/Api_Service/auth_errorhandel.dart';
import 'package:wallpapertask/features/authentication/domain/repositories/auth_repo/auth_repo.dart';
import 'package:wallpapertask/wallpapers/domain/use_cases/app_snack_bar.dart';
import 'package:wallpapertask/wallpapers/presentation/pages/MainPage/main_page.dart';

class SignupProvider extends ChangeNotifier {
  bool isLoading = false;
  String result = "";
  bool isPasswodVisible = true;
  bool isConfirmPasswodVisible = true;
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signup(
      {required AuthRepo authrepo, required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    try {
      await authrepo.signUp(
          email: mailController.text, password: passController.text);
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const MainPage()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      result = AuthErrorHandling.errorHandle(e);
      if (context.mounted) {
        AppSnackBar.customSnack(
            result: result,
            context: context,
            backgroundcolor: Colors.red,
            textcolor: Colors.white);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  showpassword({required bool isConfirm}) {
    if (isConfirm) {
      isConfirmPasswodVisible = !isConfirmPasswodVisible;
    } else {
      isPasswodVisible = !isPasswodVisible;
    }

    notifyListeners();
  }

  @override
  void dispose() {
    mailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
