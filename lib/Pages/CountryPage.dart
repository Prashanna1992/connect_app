import 'package:flutter/material.dart';
import 'package:pratham_app/Model/CountryModel.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key, required this.setCountryData}) : super(key: key);

  final Function setCountryData;

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<CountryModel> countries = [
    CountryModel(name: "Nepal", code: "977", flag: "🇳🇵"),
    CountryModel(name: "India", code: "91", flag: "🇮🇳"),
    CountryModel(name: "Pakistan", code: "92", flag: "🇵🇰"),
    CountryModel(name: "United States", code: "1", flag: "🇺🇸"),
    CountryModel(name: "South Africa", code: "27", flag: "🇿🇦"),
    CountryModel(name: "Afghanistan", code: "93", flag: "🇦🇫"),
    CountryModel(name: "United Kingdom", code: "44", flag: "🇬🇧"),
    CountryModel(name: "Italy", code: "39", flag: "🇮🇹")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            "Choose your country",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primaryVariant,
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ]),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) => card(countries[index])),
    );
  }

  Widget card(CountryModel country) {
    return InkWell(
      onTap: () {
        widget.setCountryData(country);
      },
      child: Card(
        margin: const EdgeInsets.all(0.15),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                country.flag,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                country.name,
                style: const TextStyle(fontSize: 16),
              ),
              Text(country.code)
            ],
          ),
        ),
      ),
    );
  }
}
