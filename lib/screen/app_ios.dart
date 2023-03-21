import 'package:bitcon_tiket/data/coin_data.dart';
import 'package:bitcon_tiket/utils/constant.dart';
import 'package:bitcon_tiket/widget/button_card_for_main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CoinData coinData = CoinData();
List<String> pickerItems = coinData.getCurrenciesList();

class AppIos extends StatefulWidget {
  @override
  _AppIosState createState() => _AppIosState();
}

class _AppIosState extends State<AppIos> {
  int firstItemInPickerItems = 0;


double rateCoinBTC = 0.0;
  double rateCoinETH = 0.0;
  double rateCoinLTC = 0.0;

  String dropdownValue = pickerItems.first;


  @override
  void initState() {
    // TODO: implement initState

    getData();
    super.initState();
  }

  void getData() async {
    var dataBackBTC = await coinData.getCoinDataBTC(dropdownValue);
    var dataBackETH = await coinData.getCoinDataETH(dropdownValue);
    var dataBackLTC = await coinData.getCoinDataLTC(dropdownValue);

    setState(() {
      rateCoinBTC = dataBackBTC['rate'];
      rateCoinETH = dataBackETH['rate'];
      rateCoinLTC = dataBackLTC['rate'];
    });
  }

  // This shows a CupertinoModalPopup with a reasonable
  //fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 200,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🤑 Coin Ticker',
          style: kAppBarText,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF6C60E0),
        toolbarHeight: 80,
        toolbarOpacity: .5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFF582A8C),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              padding: EdgeInsets.only(bottom: 30),
              child: CupertinoButton(
                
                onPressed: (){
                  _showDialog(
                    CupertinoPicker(
                      
                  magnification: 3,
                  squeeze:1,
                  backgroundColor: Colors.white,
                  useMagnifier: true,
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int selectedItem) {
                    setState(() {
                      firstItemInPickerItems = selectedItem;
                      // This is called when the user selects an item.
                setState(() {
                  dropdownValue = pickerItems[selectedItem];
                  getData();
                });
                    });
                  },
                  children:
                      List<Widget>.generate(pickerItems.length, (int index) {
                    return Center(
                      child: Text(
                        pickerItems[index],
                      ),
                    );
                  }),
                )
                  );
                
                 },
                 child: Text(
                  pickerItems[firstItemInPickerItems],
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Lato'
                  ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
