import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pratham_app/Pages/CameraPage.dart';
import 'package:pratham_app/Screens/HomeScreen.dart';
import 'package:pratham_app/Screens/WelcomeScreens/LoginScreen.dart';
import 'package:pratham_app/Screens/WelcomeScreens/WelcomeScreen.dart';

import 'Screens/CameraScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(15, 185, 177, 1.0),
            //rgb(15, 185, 177) - Turquoise Topaz
            secondary: const Color.fromRGBO(69, 170, 242, 1.0),
            //rgb(69, 170, 242)
            background: const Color.fromRGBO(200, 241, 229, 1),
            primaryVariant: const Color.fromRGBO(255, 255, 255, 1.0),
            secondaryVariant: const Color.fromRGBO(147, 254, 245, 1.0),
          ),
          // primaryColor: Color.fromRGBO(15, 185, 177, 1),
          // secondaryHeaderColor: Color.fromRGBO(69, 170, 242, 1),
          backgroundColor: const Color.fromRGBO(200, 241, 229, 1.0),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Raleway",
          brightness: Brightness.light),
      home: WelcomeScreen(),
    );
  }
}
