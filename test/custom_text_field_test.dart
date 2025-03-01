import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hasan_shop/widgets/text_field.dart';

void main() {
  testWidgets('CustomTextField test', (WidgetTester tester) async {

    final controller = TextEditingController();
    const label = 'Name';
    const hintText = 'Enter your name';
    const maxLine = 1;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextField(
          controller: controller,
          label: label,
          hintText: hintText,
          maxLine: maxLine,
        ),
      ),
    ));

    expect(find.text('$label:'), findsOneWidget);

    expect(find.byWidgetPredicate(
          (widget) =>
      widget is TextField && widget.decoration?.hintText == hintText,
    ), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'John Doe');

    expect(controller.text, 'John Doe');

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextField(
          controller: controller,
          label: label,
          hintText: hintText,
          maxLine: 3, // Test with more lines.
        ),
      ),
    ));

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.maxLines, 3);
  });
}