import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hasan_shop/widgets/drop_down_button.dart';

void main() {
  testWidgets('CustomDropDownBtn displays hint and selects an item', (WidgetTester tester) async {
    String? selectedItem;
    final List<String> testItems = ['Option 1', 'Option 2', 'Option 3'];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomDropDownBtn(
            items: testItems,
            hint: 'Select an option',
            onSelect: (value) {
              selectedItem = value;
            },
          ),
        ),
      ),
    );

    // Verify the hint is displayed
    expect(find.text('Select an option'), findsOneWidget);

    // Tap to open dropdown
    await tester.tap(find.byType(DropdownButtonHideUnderline));
    await tester.pumpAndSettle();

    // Verify dropdown items are displayed
    for (var item in testItems) {
      expect(find.text(item), findsOneWidget);
    }

    // Select an item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the selected item is updated
    expect(selectedItem, 'Option 2');
  });
}
