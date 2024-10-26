import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpapertask/features/authentication/presentation/pages/LoginPage/login_page.dart';
import 'package:wallpapertask/wallpapers/presentation/pages/MainPage/main_page.dart';

class CheckUser {
  static checkLogin() async {
    Widget? home;
    final user = await FirebaseAuth.instance.userChanges().first;
    if (user == null) {
      home = const LoginPage();
    } else {
      home = const MainPage();
    }

    return home;
  }
}
