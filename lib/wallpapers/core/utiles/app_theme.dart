import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpapertask/wallpapers/core/utiles/apptext_theme.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';

class CustomAppTheme {
  static ThemeData darkTheme() {
    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      canvasColor: ColorHelper.buttonColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorHelper.buttonColor,
          foregroundColor: ColorHelper.white),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 30),
          elevation: 0,
          backgroundColor: ColorHelper.buttonColor),
      iconTheme: const IconThemeData(color: ColorHelper.white),
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
        color: ColorHelper.white,
      )),
      colorScheme: ColorScheme.fromSeed(
          primary: ColorHelper.white, seedColor: Colors.white),
      appBarTheme: const AppBarTheme(
          backgroundColor: ColorHelper.darkBackground,
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: ColorHelper.darkBackground,
              statusBarIconBrightness: Brightness.light)),
      scaffoldBackgroundColor: ColorHelper.darkBackground,
      textTheme: ApptextTheme.appTextTheme(),
    );
  }

  static ThemeData appWhiteTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorHelper.lightBackground,
      appBarTheme: const AppBarTheme(
          backgroundColor: ColorHelper.lightBackground,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: ColorHelper.lightBackground)),
      canvasColor: ColorHelper.buttonColor,
      textTheme: ApptextTheme.appTextTheme(),
      iconTheme: const IconThemeData(color: ColorHelper.white),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(size: 30, color: ColorHelper.white),
          unselectedIconTheme:
              IconThemeData(size: 30, color: ColorHelper.white),
          elevation: 0,
          backgroundColor: ColorHelper.buttonColor),
    );
  }
}
