// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';
import 'package:dare_circle/src/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that SplashView renders "Dare Circle".
    expect(find.text('Dare Circle'), findsOneWidget);
  });
}
