

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/coloured_text_box_widget.dart';

void main() {
  testWidgets('Layout stays consistent', (WidgetTester tester) async {
    await tester.pumpWidget(ColouredTextBoxWidget(displayValue: "1.0", color: Colors.red));
    await matchesGoldenFile("coloured-text-1.png");
    await tester.pumpWidget(ColouredTextBoxWidget(displayValue: "10.0", color: Colors.red));
    await matchesGoldenFile("coloured-text-10.png");
  });
}