import 'package:flutter/material.dart';
import 'package:hasan_shop/widgets/drop_down_button.dart';
import 'package:hasan_shop/widgets/text_field.dart';

class AddProductPage extends StatelessWidget {
   const AddProductPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700), ),centerTitle: true,backgroundColor: Colors.deepOrangeAccent,foregroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              runSpacing: 16,
              children: [
                CustomTextField(
                  label: 'Product Name',
                  hintText: 'Enter product name',
                ),
                CustomTextField(
                  label: 'Product Description',
                  hintText: 'Enter product Description',
                  maxLine: 5,
                ),
                CustomTextField(
                  label: 'Image URL',
                  hintText: 'Enter product image',
                ),
                CustomTextField(
                  label: 'Price',
                  hintText: 'Enter product price',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropDownBtn(items: ['shop_1','shop_2','shop_3'], onSelect: (selectedValue ) { print(selectedValue); },),
                    CustomDropDownBtn(items: ['brand_1','brand_2','brand_3'],onSelect: (selectedValue ) { print(selectedValue); },),
                  ],
                ),
                Row(
                  children: [
                    Text("Any Offer?"),
                    SizedBox(width: 20,),
                    CustomDropDownBtn(items: ['offer_1','offer_2','offer_3'],onSelect: (selectedValue ) { print(selectedValue); },)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
