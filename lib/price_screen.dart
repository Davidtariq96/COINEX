// import 'package:coinex/networking.dart';
import 'package:flutter/material.dart';
import 'package:coinex/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedOption = "USD";
  // String? coinRate;

  Map<String, String> listOfTokens = {};

  void getInfo() async {
    try {
      Data data = Data();
      var coins = await data.fetchRemoteData(currency: selectedOption);
      setState(() {
        listOfTokens = coins;
      });
    } catch (e) {
      throw "$e";
    }
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  DropdownButton androidDropDownButton() {
    List<DropdownMenuItem<String>> allItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      allItems.add(item);
    }
    return DropdownButton<String>(
      value: selectedOption,
      items: allItems,
      onChanged: (value) {
        setState(
          () {
            selectedOption = value ?? "";
            getInfo();
          },
        );
      },
    );
  }

  CupertinoPicker iOSPickerView() {
    List<Text> listOfItems = [];
    for (String currency in currenciesList) {
      var items = Text(currency);
      listOfItems.add(items);
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 50.5,
      onSelectedItemChanged: (int value) {
        selectedOption = currenciesList[value];
        getInfo();
      },
      children: listOfItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🤑 COINEX"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ReusableCoinCards(
            coinRate: listOfTokens["BTC"],
            selectedOption: selectedOption,
            crypto: "BTC",
          ),
          ReusableCoinCards(
            coinRate: listOfTokens["ETH"],
            selectedOption: selectedOption,
            crypto: "ETH",
          ),
          ReusableCoinCards(
            coinRate: listOfTokens["BNB"],
            selectedOption: selectedOption,
            crypto: "BNB",
          ),
          ReusableCoinCards(
            coinRate: listOfTokens["LTC"],
            selectedOption: selectedOption,
            crypto: "LTC",
          ),
          ReusableCoinCards(
            coinRate: listOfTokens["FTM"],
            selectedOption: selectedOption,
            crypto: "FTM",
          ),
          Container(
            height: 200.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.blue,
            child: Platform.isIOS ? iOSPickerView() : androidDropDownButton(),
          )
        ],
      ),
    );
  }
}

class ReusableCoinCards extends StatelessWidget {
  const ReusableCoinCards(
      {Key? key,
      required this.coinRate,
      required this.selectedOption,
      required this.crypto})
      : super(key: key);

  final String? coinRate;
  final String selectedOption;
  final String crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $coinRate $selectedOption',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
