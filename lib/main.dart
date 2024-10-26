import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapertask/firebase_options.dart';
import 'package:wallpapertask/wallpapers/core/utiles/app_theme.dart';

import 'package:wallpapertask/wallpapers/domain/use_cases/check_user.dart';
import 'package:wallpapertask/wallpapers/domain/use_cases/removesplash.dart';
import 'package:wallpapertask/wallpapers/presentation/pages/NoConnectionPage/no_connection_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Widget home = await CheckUser.checkLogin();
  runApp(MyApp(
    home: home,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.home});
  final Widget home;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Removesplash.removesplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(326, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Walper',
              theme: CustomAppTheme.appWhiteTheme(),
              darkTheme: CustomAppTheme.darkTheme(),
              home: StreamBuilder<List<ConnectivityResult>>(
                stream: Connectivity().onConnectivityChanged,
                builder: (context, snapshot) {
                  if (snapshot.data?.contains(ConnectivityResult.none) ??
                      false) {
                    return const NoConnectionPage();
                  } else {
                    return widget.home;
                  }
                },
              ));
        });
  }
}
