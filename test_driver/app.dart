import 'dart:convert';

import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:bitcoin_calculator/main.dart' as app;
import 'package:test/test.dart';

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();

  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('Calculator', () {
    test('Scenario: we are on the home screen and select BTC to USD', () async {
      final newBTCtoUSDFinder = find.byValueKey('BTC-to-USD-button');

      final newButtonFinder = find.byValueKey('Calculate-BTC-to-USD-button');

      await driver.tap(newBTCtoUSDFinder);

      expect(await driver.getText(newButtonFinder), 'Calculate USD');
    });
    test('Scenario: we are on the home screen and select USD to BTC', () async {
      final newUSDtoBTCFinder = find.byValueKey('USD-to-BTC-button');

      final newButtonFinder = find.byValueKey('Calculate-USD-to-BTC-button');

      await driver.tap(newUSDtoBTCFinder);

      expect(await driver.getText(newButtonFinder), 'Calculate BTC');
    });
  });
}
