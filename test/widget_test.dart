import 'package:flutter_test/flutter_test.dart';
import 'package:placeme/main.dart';

void main() {
  testWidgets('App starts', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
  });
}