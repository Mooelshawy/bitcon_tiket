import 'package:bitcon_tiket/screen/pricing_screen.dart';
import 'package:bitcon_tiket/utils/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ticker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber),
      home: PricingScreen(),
    );
  }
}
