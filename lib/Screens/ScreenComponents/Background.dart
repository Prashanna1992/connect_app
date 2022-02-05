import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/main_top.png',
                width: size.width * 0.3,
                color: Theme.of(context).colorScheme.primary,
              )),
          Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/main_bottom.png',
                width: size.width * 0.2,
                color: Theme.of(context).colorScheme.secondaryVariant,
              )),
          child,
        ],
      ),
    );
  }
}
