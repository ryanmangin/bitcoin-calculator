import 'dart:io';
import 'package:flutter/material.dart';
import 'BtcToDollars.dart';
import 'DollarsToBtc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0x88888888)),
      home: MyHomePage(title: 'Bitcoin Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                key: Key('BTC-to-USD-button'),
                child: Row(
                  children: <Widget>[
                    Text(
                      'BTC To USD',
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BtcToDollars()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                key: Key('USD-to-BTC-button'),
                child: Row(
                  children: <Widget>[
                    Text(
                      'USD To BTC',
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DollarsToBtc()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
