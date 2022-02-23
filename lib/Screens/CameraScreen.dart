import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pratham_app/Screens/PhotoView.dart';
import 'package:pratham_app/Screens/VideoView.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraScreen({this.cameras, Key? key, required this.onImageSend})
      : super(key: key);
  final Function onImageSend;
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  XFile? pictureFile;
  XFile? videoFile;
  bool isRecording = false;
  bool flash = false;
  bool isRearCamera = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      // ),
      body: Stack(
        children: [
          FutureBuilder(
              future: controller.initialize(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(controller),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
              bottom: 0,
              child: Container(
                  height: 100,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: flash
                                ? const Icon(Icons.flash_on)
                                : const Icon(Icons.flash_off),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                flash = !flash;
                              });
                              flash
                                  ? setFlashMode(FlashMode.torch)
                                  : setFlashMode(FlashMode.off);

                              flash ? print("Flash ON!") : print("FLASH OFF");
                            },
                          ),
                          GestureDetector(
                            onLongPress: () async {
                              setState(() {
                                isRecording = true;
                              });
                              await controller.startVideoRecording();
                            },
                            onLongPressUp: () async {
                              setState(() {
                                isRecording = false;
                              });
                              videoFile = await controller.stopVideoRecording();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => VideoView(
                                            path: videoFile!.path,
                                          )));
                            },
                            onTap: () {
                              print("Tapped for photo!");
                              if (!isRecording) {
                                takePhoto(context);
                              }
                            },
                            child: isRecording
                                ? const Icon(
                                    Icons.radio_button_checked,
                                    color: Colors.red,
                                    size: 50,
                                  )
                                : const Icon(
                                    Icons.panorama_fish_eye,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                          ),
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(isRearCamera ? 0 : pi),
                            child: IconButton(
                              icon: const Icon(Icons.flip_camera_ios),
                              onPressed: () async {
                                int cameraPosition = isRearCamera ? 0 : 1;
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(SnackBar(
                                //   content: isRearCamera
                                //       ? const Text("Rear Cam")
                                //       : const Text("Front Cam"),
                                // ));
                                setState(() {
                                  isRearCamera = !isRearCamera;
                                });
                                controller = CameraController(
                                  widget.cameras![cameraPosition],
                                  ResolutionPreset.max,
                                );
                                controller.initialize().then((_) {
                                  if (!mounted) {
                                    return;
                                  }
                                  setState(() {});
                                });
                              },
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Tap to take a  photo",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )))
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    pictureFile = await controller.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => PhotoView(
                  path: pictureFile!.path,
                  onImageSend: widget.onImageSend(),
                )));
  }

  Future<void> setFlashMode(FlashMode mode) async {
    await controller.setFlashMode(mode);
  }
}
