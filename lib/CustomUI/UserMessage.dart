import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 80, minWidth: 120),
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 40, left: 10, right: 20),
                child: Text(
                  "Hello, I am the user, and this is how my messages will look! Cool! However, this is just a placeholder, before we finalize the styling from the widget page itself!",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 10,
                child: Row(
                  children: const [
                    Text(
                      "12:24 pm",
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(
                      Icons.done_all,
                      size: 15,
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
