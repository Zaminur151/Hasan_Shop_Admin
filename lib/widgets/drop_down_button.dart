import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

String? selectedValue;

class CustomDropDownBtn extends StatelessWidget {
  final List<String> items;
  final String hint;
  final Function(String?) onSelect;
  const CustomDropDownBtn({super.key, required this.items, this.hint='Select Item',required this.onSelect});



  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          hint,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
              onSelect(value);
        },
        buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: Colors.orangeAccent
              ),
              borderRadius: BorderRadius.circular(10),
            )
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
