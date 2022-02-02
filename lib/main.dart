import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pratham_app/Pages/CameraPage.dart';
import 'package:pratham_app/Screens/HomeScreen.dart';

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
            primary: Color.fromRGBO(15, 185, 177, 1),
            //rgb(15, 185, 177) - Turquoise Topaz
            secondary: Color.fromRGBO(69, 170, 242, 1.0),
            //rgb(69, 170, 242)
            background: Color.fromRGBO(200, 241, 229, 1),
          ),
          // primaryColor: Color.fromRGBO(15, 185, 177, 1),
          // secondaryHeaderColor: Color.fromRGBO(69, 170, 242, 1),
          backgroundColor: Color.fromRGBO(200, 241, 229, 1.0),
          fontFamily: "Raleway",
          brightness: Brightness.light),
      home: const HomeScreen(),
    );
  }
}
