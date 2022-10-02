import 'package:clothes_app_api/test.dart';
import 'package:clothes_app_api/users/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothes app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:FutureBuilder(
        builder: (context,snapshot){

          return LoginScreen();
        },
      )
    );
  }
}


