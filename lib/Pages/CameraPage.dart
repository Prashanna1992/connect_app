import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pratham_app/Screens/CameraScreen.dart';

class CameraPage extends StatelessWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({Key? key, this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CameraScreen(
      cameras: cameras,
    );
  }
}
