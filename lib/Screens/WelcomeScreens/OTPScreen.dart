import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pratham_app/Screens/WelcomeScreens/LoginScreen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.number, required this.code})
      : super(key: key);
  final String number;
  final String code;

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final int otpLength = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryVariant,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Verify your number",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primaryVariant,
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
        ),
        actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    const TextSpan(text: "We have sent a code to "),
                    TextSpan(
                        text: "+" + widget.code + "-" + widget.number + "\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary)),
                  ]),
            ),
            TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Not your number?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12))),
            const SizedBox(
              height: 10,
            ),
            OTPTextField(
              length: otpLength,
              width: MediaQuery.of(context).size.width - 100,
              fieldWidth: 30,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onChanged: (String? pin) {
                if (pin?.length == 6) {}
              },
              onCompleted: (pin) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => LoginScreen()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter 6-digit OTP Code",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            textButtons("Resend SMS", Icons.message_outlined),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            textButtons("Call Me", Icons.phone)
          ],
        ),
      ),
    );
  }

  Widget textButtons(String text, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 25,
        ),
        const SizedBox(
          width: 15,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              text,
            )),
      ],
    );
  }
}
