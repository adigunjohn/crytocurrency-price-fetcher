import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../coin_data.dart';
import 'dart:io' show Platform;
import 'package:jonny_bitcoin_ticker/services/networking.dart';
import 'package:jonny_bitcoin_ticker/widgets/card_widget.dart';
import 'dart:convert';

class PriceSreen extends StatefulWidget {
  const PriceSreen({Key? key}) : super(key: key);

  @override
  State<PriceSreen> createState() => _PriceSreenState();
}

class _PriceSreenState extends State<PriceSreen> {
@override
 void initState (){
  super.initState();
  getData();
}

  String selectedCurrency = 'USD';
  int? fetchedPriceData;
  int? fetchedPriceDataE;
  int? fetchedPriceDataL;


  DropdownButton androidDropDownButton () {
    List<DropdownMenuItem<String>> dropDownMenuItems = [];
    // for (int i = 0; i < currencyList.length; i++) {
    //   String currency = currencyList[i];
    for (String currency in currencyList) {
      var newDropDown = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownMenuItems.add(newDropDown);
    }

  return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownMenuItems,
  onChanged: (value) {
    setState(() {
      selectedCurrency = value.toString();
    });
    getData();
    print(value);
  });
  }

  CupertinoPicker iOSPicker (){
    List<Text> cupertinoPickers = [];
    for (String currency in currencyList) {
      var newPicker = Text(currency);
      cupertinoPickers.add(newPicker);
    }
    return CupertinoPicker(
      scrollController: FixedExtentScrollController(initialItem: 19),
      backgroundColor: Colors.blue,
      itemExtent: 25.0,
      onSelectedItemChanged: (i) {
        setState(() {
          selectedCurrency = currencyList[i];
          print(currencyList[i]);
        });
        getData();
      },
      children: cupertinoPickers,
    );
  }

  NetworkDataFetcher networkDataFetcher = NetworkDataFetcher();
  Future getData () async{
   var priceData = await networkDataFetcher.fetchData(selectedCurrency);
   var priceBTC = jsonDecode(priceData)['data']['BTC'][0]['quote']['$selectedCurrency']['price'];
   var priceETH = jsonDecode(priceData)['data']['ETH'][0]['quote']['$selectedCurrency']['price'];
   var priceLTC = jsonDecode(priceData)['data']['LTC'][0]['quote']['$selectedCurrency']['price'];

   setState(() {
     fetchedPriceData = priceBTC.toInt();
     fetchedPriceDataE = priceETH.toInt();
     fetchedPriceDataL = priceLTC.toInt();
   });
   print(fetchedPriceData);
   print(fetchedPriceDataE);
   print(fetchedPriceDataL);
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardWidget(textdata: '1 BTC = $fetchedPriceData $selectedCurrency'),
              CardWidget(textdata: '1 ETH = $fetchedPriceDataE $selectedCurrency'),
              CardWidget(textdata: '1 LTC = $fetchedPriceDataL $selectedCurrency'),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 150.0,
            color: Colors.blue,
            padding: EdgeInsets.only(bottom: 30.0),
            child: Platform.isIOS ? iOSPicker() : androidDropDownButton(),
            ///Platform.isIOS ? iOSPicker() : androidDropDownButton()
          ),
        ],
      ),
    );
  }
}
