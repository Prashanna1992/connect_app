import 'dart:io';

import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.ownImage,
    required this.filePath,
  }) : super(key: key);
  final bool ownImage;
  final String filePath;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: ownImage ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.2,
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.secondaryVariant),
          child: Card(
            margin: EdgeInsets.all(2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Image.file(File(filePath)),
          ),
        ),
      ),
    );
  }
}
