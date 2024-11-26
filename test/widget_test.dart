import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:h/main.dart';

void main() {
  testWidgets("Hello world", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(Container), findsOneWidget);
  });
}
