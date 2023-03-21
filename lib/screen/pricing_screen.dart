import 'package:bitcon_tiket/data/coin_data.dart';
import 'package:bitcon_tiket/screen/app_ios.dart';
import 'package:bitcon_tiket/utils/constant.dart';
import 'package:flutter/material.dart';

import '../widget/button_card_for_main_screen.dart';

CoinData dataList = CoinData();
List<String> dropDownItems = dataList.getCurrenciesList();

class PricingScreen extends StatefulWidget {
  @override
  _PricingScreenState createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  double rateCoinBTC = 0.0;
  double rateCoinETH = 0.0;
  double rateCoinLTC = 0.0;

  String dropdownValue = dropDownItems.first;

  @override
  void initState() {
    // TODO: implement initState

    getData();
    super.initState();
  }

  void getData() async {
    var dataBackBTC = await dataList.getCoinDataBTC(dropdownValue);
    var dataBackETH = await dataList.getCoinDataETH(dropdownValue);
    var dataBackLTC = await dataList.getCoinDataLTC(dropdownValue);

    setState(() {
      rateCoinBTC = dataBackBTC['rate'];
      rateCoinETH = dataBackETH['rate'];
      rateCoinLTC = dataBackLTC['rate'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
        backgroundColor: Color(0xFF6C60E0),
        elevation: 2,
        toolbarHeight: 80,
        toolbarOpacity: .8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AppIos();
              }));
            },
            child: Padding(
              child: Icon(Icons.move_up_rounded),
              padding: EdgeInsets.all(20),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ButtonCardForMainScreen(
            cryptoList: 'BTC',
            cryptoValue: rateCoinBTC.toInt(),
            selectedCrypto: dropdownValue,
          ),
          ButtonCardForMainScreen(
            cryptoList: 'ETH',
            cryptoValue: rateCoinETH.toInt(),
            selectedCrypto: dropdownValue,
          ),
          ButtonCardForMainScreen(
            cryptoList: 'LTC',
            cryptoValue: rateCoinLTC.toInt(),
            selectedCrypto: dropdownValue,
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFF582A8C),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                )),
            padding: EdgeInsets.only(bottom: 30.0),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              dropdownColor: Colors.deepPurple,
              value: dropdownValue,
              icon: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
              elevation: 10,
              style: kDropDownListItem,
              underline: Container(
                height: 3,
                color: Colors.white,
              ),
              onChanged: (String? value) async {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                  getData();
                });
              },
              items:
                  dropDownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: kDropDownListItem,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
