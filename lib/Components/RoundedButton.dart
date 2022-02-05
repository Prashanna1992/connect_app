import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.primaryColor,
    required this.textColor,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final Color primaryColor;
  final Color textColor;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
            style: TextButton.styleFrom(
                primary: textColor,
                backgroundColor: primaryColor,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
