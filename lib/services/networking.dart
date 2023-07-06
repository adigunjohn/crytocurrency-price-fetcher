
import 'package:http/http.dart' as http;

class NetworkDataFetcher {

    Future<dynamic> fetchData(String currencyName) async {
      http.Response response = await http.get(Uri.parse(
          'https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest?symbol=BTC,ETH,LTC&convert=$currencyName'),
          headers: {
            'X-CMC_PRO_API_KEY': '7f6e4145-4b4d-4221-86c2-6f3c76c4b63d',
            "Accept": "application/json",
          });
      print(response.statusCode);

        if(response.statusCode == 200) {
          // print(response.body);
          String fetchedData = response.body;
          return fetchedData;
        }
        else{
          print(response.statusCode);
        }

  // Future<dynamic> fetchData(String currencyName) async {
  //   http.Response response = await http.get(Uri.parse('https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest?symbol=BTC&convert=$currencyName&CMC_PRO_API_KEY=7f6e4145-4b4d-4221-86c2-6f3c76c4b63d'),);
  //   print(response.statusCode);
  //
  //   if(response.statusCode == 200) {
  //     print(response.body);
  //     String fetchedData = response.body;
  //     var priceBTC = jsonDecode(fetchedData)['data']['BTC'][0]['quote']['$currencyName']['price'];
  //
  //     return priceBTC;
  //   }
  //   else{
  //     print(response.statusCode);
  //   }


  }
}





