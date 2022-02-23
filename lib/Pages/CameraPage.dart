import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pratham_app/Screens/CameraScreen.dart';

class CameraPage extends StatelessWidget {
  final List<CameraDescription>? cameras;
  final Function onImageSend;
  const CameraPage({Key? key, this.cameras, required this.onImageSend})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CameraScreen(
      cameras: cameras,
      onImageSend: () => onImageSend,
    );
  }
}
