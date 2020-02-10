

import 'package:flutter/cupertino.dart';
import 'package:flutter_auckland_feb20/WidgetKeys.dart';
import 'package:flutter_auckland_feb20/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  boxTextData(WidgetTester tester, String key) async {
  }

  testWidgets('Main app responds to slider movement', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    expect(tester.boxData(WidgetKeys.box1), completion(equals('0.0')));
    expect(tester.boxData(WidgetKeys.box2), completion(equals('1.0')));
    expect(tester.boxData(WidgetKeys.box3), completion(equals('10.0')));
    expect(tester.boxData(WidgetKeys.box4), completion(equals('10.0')));

    final sliderKey = find.byKey(Key(WidgetKeys.slider));
    final Offset topLeft = tester.getTopLeft(sliderKey);
    final Offset bottomRight = tester.getBottomRight(sliderKey);

    final Offset target = topLeft + (bottomRight - topLeft) / 2.0;
    await tester.tapAt(target);
    await tester.pumpAndSettle();

    expect(tester.boxData(WidgetKeys.box1), completion(equals('5.0')));
    expect(tester.boxData(WidgetKeys.box2), completion(equals('6.0')));
    expect(tester.boxData(WidgetKeys.box3), completion(equals('4.0')));
    expect(tester.boxData(WidgetKeys.box4), completion(equals('5.0')));
  });
}

extension BoxText on WidgetTester {
  Future<String> boxData(String key) async {
    Text text = await widget(find.descendant(of: find.byKey(Key(key)), matching: find.byKey(Key(WidgetKeys.boxText))));
    return text.data;
  }
}