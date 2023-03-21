

import 'package:flutter/material.dart';

import '../utils/constant.dart';
class ButtonCardForMainScreen extends StatelessWidget {
   ButtonCardForMainScreen({super.key, 
    required this.cryptoList ,
    required this.cryptoValue,
    required this.selectedCrypto,

   });

  String cryptoList ;
  int cryptoValue ;
  String selectedCrypto ; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Color(0xFF6C60E0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoList = $cryptoValue $selectedCrypto',
            textAlign: TextAlign.center,
            style: kAppBarText,
          ),
        ),
      ),
    );
  }
}
