import 'dart:math';

import 'package:bitcoin_calculator/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

main() {
  test('returns the value of bitcoin if call completes successfully', () async {
    final client = MockClient();

    final mockBitcoinPrice =
        '{"time":{"updated":"Apr 1, 2021 01:31:00 UTC","updatedISO":"2021-04-01T01:31:00+00:00","updateduk":"Apr 1, 2021 at 02:31 BST"},"disclaimer":"This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org","bpi":{"USD":{"code":"USD","rate":"59,138.4850","description":"United States Dollar","rate_float":59138.485}}}';

    var url =
        Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');

    when(client.get(url))
        .thenAnswer((_) async => http.Response(mockBitcoinPrice, 200));

    double bitcoinPrice = await BitcoinAPI.fetchPrice(client);

    expect(bitcoinPrice, isA<double>());

    expect(bitcoinPrice, 59138.485);
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();

    var url =
        Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');

    when(client.get(url))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    expect(BitcoinAPI.fetchPrice(client), throwsException);
  });
}
