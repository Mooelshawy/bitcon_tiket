import 'package:bitcon_tiket/data/networking_helper.dart';


const String coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

const String myApiKey = 'YOUR_API_KEY';




class CoinData {


 List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
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

 List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
  List<String> getCurrenciesList() {
    return currenciesList;
  }

  Future<dynamic> getCoinDataBTC(String coinName) async{
    NetworkingHelper networkingHelper =
        NetworkingHelper(url: "$coinApiUrl/BTC/$coinName?apikey=$myApiKey");

    var btcData = await  networkingHelper.getDataFromNetwork();
    return btcData;
  }

  Future<dynamic> getCoinDataETH(String coinName) async{
    NetworkingHelper networkingHelper =
        NetworkingHelper(url: "$coinApiUrl/ETH/$coinName?apikey=$myApiKey");

    var ethData = await networkingHelper.getDataFromNetwork();
    return ethData;
  }

  Future<dynamic> getCoinDataLTC(String coinName) async{
    NetworkingHelper networkingHelper =
        NetworkingHelper(url: "$coinApiUrl/LTC/$coinName?apikey=$myApiKey");

    var ltcData = await  networkingHelper.getDataFromNetwork();
    return ltcData;
  }
}
