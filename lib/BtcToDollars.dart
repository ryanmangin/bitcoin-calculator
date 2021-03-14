import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BtcToDollars extends StatefulWidget {
  BtcToDollars({Key key}) : super(key: key);

  @override
  _BtcToDollarsState createState() => _BtcToDollarsState();
}

class _BtcToDollarsState extends State<BtcToDollars> {
  final txtBTCtoUSD = TextEditingController();
  final txtConversion = TextEditingController();
  final formatCurrency = new NumberFormat.simpleCurrency();

  double value;
  void calculateDollarsToBTC() {
    setState(() {
      double _value = double.parse(txtBTCtoUSD.text) * 56762.80;
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BTC to Dollars")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            value == null
                ? Column(
                    children: <Widget>[
                      TextField(
                        controller: txtBTCtoUSD,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Amount",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                        textInputAction: TextInputAction.done,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                      Text('Enter Valid Input',
                          style: TextStyle(color: Colors.red))
                    ],
                  )
                : Column(children: <Widget>[
                    Text(
                      '${formatCurrency.format(value)} USD',
                    ),
                    TextField(
                      controller: txtBTCtoUSD,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Amount",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 12.0),
                      textInputAction: TextInputAction.done,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Calculate USD',
                    ),
                  ],
                ),
                onPressed: () {
                  calculateDollarsToBTC();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
