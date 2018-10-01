import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:boring_flutter/main.dart';

void main() {
  testWidgets('Clicking tile then opens it', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    expect(find.byIcon(Icons.launch), findsNothing);
    
    await tester.tap(find.byType(ExpansionTile).first);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.launch), findsOneWidget);
  });
}
