import 'dart:io';

import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.crop)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.emoji_emotions_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.title)),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  color: Theme.of(context).colorScheme.primary.withOpacity(.2),
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    maxLines: 6,
                    minLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                      hintText: "Add Caption..",
                      prefixIcon: const Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 35,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: CircleAvatar(
                        radius: 15,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
