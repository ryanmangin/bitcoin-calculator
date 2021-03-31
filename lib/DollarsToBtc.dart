import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/src/response.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'api.dart';
import 'globals.dart';

class DollarsToBtc extends StatefulWidget {
  DollarsToBtc({Key key}) : super(key: key);

  @override
  _DollarsToBtcState createState() => _DollarsToBtcState();
}

class _DollarsToBtcState extends State<DollarsToBtc> {
  Future<double> futurePrice;
  double bitcoinPrice;
  @override
  void initState() {
    super.initState();
    BitcoinAPI.fetchPrice(httpClient).then((double result) {
      setState(() {
        bitcoinPrice = result;
      });
    });
  }

  final txtUSDtoBTC = TextEditingController();
  final txtConversion = TextEditingController();
  double value;

  void calculateDollarsToBTC() {
    setState(() {
      double _value = double.parse(txtUSDtoBTC.text) / bitcoinPrice;
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dollars to BTC")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            value == null
                ? Column(children: <Widget>[
                    TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: txtUSDtoBTC,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Amount",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        inputFormatters: [
                          WhitelistingTextInputFormatter(
                              RegExp(r'^(\d+)?\.?\d{0,2}')),
                        ],
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true)),
                    Text('Enter Valid Input',
                        style: TextStyle(color: Colors.red))
                  ])
                : Column(
                    children: [
                      Text(
                        '${value.toStringAsFixed(7)} BTC',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: txtUSDtoBTC,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Amount",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                          inputFormatters: [
                            WhitelistingTextInputFormatter(
                                RegExp(r'^(\d+)?\.?\d{0,2}')),
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true)),
                    ],
                  ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                key: Key('Calculate-BTC-to-USD-button'),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Calculate BTC',
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
