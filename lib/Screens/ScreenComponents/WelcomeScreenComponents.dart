import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';
import 'package:pratham_app/Components/RoundedButton.dart';
import 'package:pratham_app/Pages/LoginPage.dart';
import 'package:pratham_app/Screens/ScreenComponents/Background.dart';

class WelcomeScreenComponents extends StatelessWidget {
  const WelcomeScreenComponents({Key? key}) : super(key: key);

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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 16),
                  children: [
                    const TextSpan(
                        text: "\"Agree and Continue\" to accept ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text:
                            "ConnectApp's Terms of Service and Privacy Policy.",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).colorScheme.primary))
                  ],
                ),
              ),
            ),
            RoundedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const LoginPage()),
                      (route) => false);
                },
                primaryColor: Theme.of(context).colorScheme.secondaryVariant,
                textColor: Theme.of(context).colorScheme.primary,
                buttonText: "Agree and Continue"),
          ],
        ),
      ),
    );
  }
}
