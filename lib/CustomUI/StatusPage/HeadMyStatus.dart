import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadMyStatus extends StatelessWidget {
  const HeadMyStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "My Status",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary),
      ),
      subtitle: Text(
        "Tap to add status update",
        style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
            fontStyle: FontStyle.italic),
      ),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage("assets/me.jpg"),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryVariant,
                radius: 15,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 13,
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.primaryVariant,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
