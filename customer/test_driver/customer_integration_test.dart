import 'package:flutter_driver/flutter_driver.dart' as customer;
import 'package:flutter_test/flutter_test.dart' as test;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Customer App', () {
    late customer.FlutterDriver flutterDriver;

    // Set up the driver before running the tests.
    setUpAll(() async {
      flutterDriver = await customer.FlutterDriver.connect();
    });

    // Close the driver after the tests are completed.
    tearDownAll(() async {
      await flutterDriver.close();
    });

    // Write your integration tests here.
    test.test('Verify if the welcome message is displayed', () async {
      // Find the welcome message on the screen.
      final welcomeTextFinder = customer.find.text('Welcome to Hummy App');

      // Verify that the welcome message is displayed.
      final welcomeText = await flutterDriver.getText(welcomeTextFinder);
      expect(welcomeText, 'Welcome to Hummy App');
    });
  });
}
