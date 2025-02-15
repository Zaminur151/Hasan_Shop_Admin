import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isField;
  final int maxLine;
  final TextEditingController controller;
  const CustomTextField({super.key,required this.controller, required this.label, this.hintText='',this.isField = true, this.maxLine=1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label:",style: TextStyle(color: Colors.orangeAccent),),
        SizedBox(height: 8,),
        TextField(
          controller: controller,
          maxLines: maxLine,
          cursorColor: Colors.orangeAccent,
          decoration: InputDecoration(
            // label: Text(label,
            //   style: TextStyle(
            //     color: Colors.orangeAccent
            // ),),
            hintText: hintText,
            filled: isField,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
