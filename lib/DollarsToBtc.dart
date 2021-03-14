import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DollarsToBtc extends StatefulWidget {
  DollarsToBtc({Key key}) : super(key: key);

  @override
  _DollarsToBtcState createState() => _DollarsToBtcState();
}

class _DollarsToBtcState extends State<DollarsToBtc> {
  final txtUSDtoBTC = TextEditingController();
  final txtConversion = TextEditingController();
  double value;
  void calculateDollarsToBTC() {
    setState(() {
      double _value = double.parse(txtUSDtoBTC.text) / 56762.80;
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
                        controller: txtUSDtoBTC,
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
                    Text('Enter Valid Input',
                        style: TextStyle(color: Colors.red))
                  ])
                : Column(
                    children: [
                      Text(
                        '${value.toStringAsFixed(7)} BTC',
                      ),
                      TextFormField(
                          controller: txtUSDtoBTC,
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
