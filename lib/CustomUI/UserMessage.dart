import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({Key? key, required this.message, required this.time})
      : super(key: key);
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 80, minWidth: 140),
        child: Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          color: Theme.of(context).colorScheme.primary,
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
                right: 10,
                child: Row(
                  children: [
                    Text(
                      time,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    Icon(
                      Icons.done_all,
                      size: 19,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
