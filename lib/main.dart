import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foodie/utils/app_routes.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:foodie/utils/app_theme.dart';
import 'AppProviders.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // 👇 Permission request
  await messaging.requestPermission();
  String? token = await messaging.getToken();
  print("FCM TOKEN: $token");
  runApp(AppProviders.build(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie',
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}