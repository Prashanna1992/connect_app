// ignore: file_names
import 'package:flutter/material.dart';

class ReplyMessage extends StatelessWidget {
  const ReplyMessage({Key? key, required this.message, required this.time})
      : super(key: key);
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 80, minWidth: 120),
        child: Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          color: Theme.of(context).colorScheme.secondary,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 25, left: 15, right: 15),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 20,
                child: Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
