import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:flutter_test/flutter_test.dart' as test;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Hummy App', () {
    late driver.FlutterDriver flutterDriver;

    // Set up the driver before running the tests.
    setUpAll(() async {
      flutterDriver = await driver.FlutterDriver.connect();
    });

    // Close the driver after the tests are completed.
    tearDownAll(() async {
      await flutterDriver.close();
    });

    // Write your integration tests here.
    test.test('Verify if the welcome message is displayed', () async {
      // Find the welcome message on the screen.
      final welcomeTextFinder = driver.find.text('Welcome to Hummy App');

      // Verify that the welcome message is displayed.
      final welcomeText = await flutterDriver.getText(welcomeTextFinder);
      expect(welcomeText, 'Welcome to Hummy App');
    });
  });
}
