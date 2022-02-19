import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratham_app/Components/RoundedButton.dart';
import 'package:pratham_app/Model/CountryModel.dart';
import 'package:pratham_app/Pages/CountryPage.dart';
import 'package:pratham_app/Screens/WelcomeScreens/OTPScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryName = "Nepal";
  String countryCode = "977";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primaryVariant,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Enter your phone number below!",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primaryVariant,
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_vert,
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "An SMS will be sent to verify your phone number!",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "What's my number?",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 14),
            ),
            const SizedBox(
              height: 20,
            ),
            countryCard(context),
            const SizedBox(
              height: 20,
            ),
            number(),
            const Spacer(),
            RoundedButton(
                onPressed: () {
                  if (_controller.text.length < 10) {
                    validationAlert();
                  } else {
                    alertDialog();
                  }
                },
                primaryColor: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.primaryVariant,
                buttonText: "Next"),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget countryCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => CountryPage(
                      setCountryData: setCountryData,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.5,
                    style: BorderStyle.solid))),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  countryName,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget number() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.5,
                        style: BorderStyle.solid))),
            child: Row(
              children: [
                const Text(
                  "+",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  countryCode,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.5,
                        style: BorderStyle.solid))),
            width: (MediaQuery.of(context).size.width / 1.5) - 100,
            child: TextFormField(
              controller: _controller,
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "Phone Number",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8)),
            ),
          )
        ],
      ),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }

  Future<void> alertDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "We will send you a verification code!",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Text(countryCode + " - " + _controller.text,
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  const Text("Is this number correct?",
                      style: TextStyle(fontSize: 14))
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Edit")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => OTPScreen(
                                  number: _controller.text,
                                  code: countryCode,
                                )));
                  },
                  child: const Text("Yes"))
            ],
          );
        });
  }

//  Validation Alert
  Future<void> validationAlert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Your number is too short or invalid! Please try again!",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"))
            ],
          );
        });
  }
}
