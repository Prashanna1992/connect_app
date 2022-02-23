import 'package:flutter/material.dart';
import 'package:pratham_app/Screens/ScreenComponents/WelcomeScreenComponents.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeScreenComponents(),
    );
  }
}
