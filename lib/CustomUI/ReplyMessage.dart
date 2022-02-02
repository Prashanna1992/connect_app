// ignore: file_names
import 'package:flutter/material.dart';

class ReplyMessage extends StatelessWidget {
  const ReplyMessage({Key? key}) : super(key: key);

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
            children: const [
              Padding(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                child: Text(
                  "Hello user, I am the one replying to your messages! The replies look like THIS!",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 20,
                child: Text(
                  "12:24 pm",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
