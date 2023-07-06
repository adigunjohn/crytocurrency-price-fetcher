import 'package:flutter/material.dart';
import 'package:jonny_bitcoin_ticker/screens/price_screen.dart';

void main(){
  runApp(BitcoinTicker());
}

class BitcoinTicker extends StatelessWidget {
  const BitcoinTicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
      home: PriceSreen(),
    );
  }
}

