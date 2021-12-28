import 'package:coinex/networking.dart';

const apiKeys = "89E6E9B4-E71C-4931-A75B-6893C00D4877";
const coinURL = "https://rest.coinapi.io/v1/exchangerate";
const List<String> listOfCoins = ["BTC", "ETH", "BNB", "LTC", "FTM"];

class Data {
  Future<dynamic> fetchRemoteData({required String currency}) async {
    Map<String, String> coinRates = {};
    for (String coin in listOfCoins) {
      var url = "$coinURL/$coin/$currency?apikey=$apiKeys";
      Networking networking = Networking(url: url);
      var remoteData = await networking.getData();
      coinRates[coin] = remoteData;
    }

    return coinRates;
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'NGN',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC', 'BNB'];

class CoinData {}
