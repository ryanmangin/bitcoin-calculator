import 'dart:convert';

import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:bitcoin_calculator/main.dart' as app;
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:bitcoin_calculator/globals.dart' as globals;
import 'package:bitcoin_calculator/main.dart' as app;

class MockClient extends Mock implements http.Client {}

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.

  FlutterDriver driver;

  final MockClient client = MockClient();

  final mockBitcoinPrice =
      '{"time":{"updated":"Apr 1, 2021 01:31:00 UTC","updatedISO":"2021-04-01T01:31:00+00:00","updateduk":"Apr 1, 2021 at 02:31 BST"},"disclaimer":"This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org","bpi":{"USD":{"code":"USD","rate":"59,138.4850","description":"United States Dollar","rate_float":59138.485}}}';

  var url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
  when(client.get(url))
      .thenAnswer((_) async => http.Response(mockBitcoinPrice, 200));

  globals.httpClient = client;

  app.main();

  test('gets bitcoin price', () async {
    final textFinder = find.byValueKey('bitcoinPriceFinder');

    expect(await driver.getText(textFinder),
        "Current Bitcoin Price in USD: 59138.485");
  });

  // setUpAll(() async {
  //   driver = await FlutterDriver.connect();
  // });

  // // Close the connection to the driver after the tests have completed.
  // tearDownAll(() async {
  //   if (driver != null) {
  //     driver.close();
  //   }
  // });

  // group('Calculator', () {
  //   test('Scenario: we are on the home screen and select BTC to USD', () async {
  //     final newBTCtoUSDFinder = find.byValueKey('BTC-to-USD-button');

  //     final newButtonFinder = find.byValueKey('Calculate-BTC-to-USD-button');

  //     await driver.tap(newBTCtoUSDFinder);

  //     expect(await driver.getText(newButtonFinder), 'Calculate USD');
  //   });
  //   test('Scenario: we are on the home screen and select USD to BTC', () async {
  //     final newUSDtoBTCFinder = find.byValueKey('USD-to-BTC-button');

  //     final newButtonFinder = find.byValueKey('Calculate-USD-to-BTC-button');

  //     await driver.tap(newUSDtoBTCFinder);

  //     expect(await driver.getText(newButtonFinder), 'Calculate BTC');
  //   });
  // });
}
