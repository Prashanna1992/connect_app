import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pratham_app/Components/RoundedButton.dart';
import 'package:pratham_app/Screens/ScreenComponents/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome To ConnectApp",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * .45,
              width: size.width,
            ),
            RoundedButton(
                onPressed: () {},
                primaryColor: Theme.of(context).colorScheme.secondaryVariant,
                textColor: Theme.of(context).colorScheme.primary,
                buttonText: "Login"),
            RoundedButton(
                onPressed: () {},
                primaryColor: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.primaryVariant,
                buttonText: "Sign-Up"),
          ],
        ),
      ),
    );
  }
}
