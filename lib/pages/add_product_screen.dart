import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasan_shop/controller/home_controller.dart';
import 'package:hasan_shop/widgets/drop_down_button.dart';
import 'package:hasan_shop/widgets/text_field.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text("Add New Product",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Wrap(
                  runSpacing: 16,
                  children: [
                    CustomTextField(
                      controller: ctrl.productNameCtl,
                      label: 'Product Name',
                      hintText: 'Enter product name',
                    ),
                    CustomTextField(
                      controller: ctrl.descriptionCtl,
                      label: 'Product Description',
                      hintText: 'Enter product Description',
                      maxLine: 5,
                    ),
                    CustomTextField(
                      controller: ctrl.imageCtl,
                      label: 'Image URL',
                      hintText: 'Enter product image',
                    ),
                    CustomTextField(
                      controller: ctrl.priceCtl,
                      label: 'Price',
                      hintText: 'Enter product price',
                    ),
                    Row(
                      children: [
                        Text("Any Offer?",style: TextStyle(color: Colors.deepOrangeAccent),),
                        SizedBox(width: 10,),
                        CustomDropDownBtn(
                          hint: ctrl.offer == null?"Select offer": ctrl.offer.toString(),
                          items: [
                            'true',
                            'false',
                          ], onSelect: (selectedValue) {
                          ctrl.offer = bool.tryParse(selectedValue?? 'false') ;
                          ctrl.update();
                        },)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropDownBtn(
                          width: 160,
                          hint: ctrl.category??"Select category",
                          items: ['shop_1', 'shop_2', 'shop_3'],
                          onSelect: (selectedValue) {
                            ctrl.category = selectedValue;
                            ctrl.update();
                          },),
                        CustomDropDownBtn(
                          hint: ctrl.brand??"Select brand",
                          items: [
                          'brand_1',
                          'brand_2',
                          'brand_3'
                        ], onSelect: (selectedValue) {
                          ctrl.brand = selectedValue;
                          ctrl.update();
                        },),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ctrl.addProduct();
                          ctrl.setDefaultValue();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            foregroundColor: Colors.white,
                            maximumSize: Size(double.infinity, 50),
                            minimumSize: Size(double.infinity, 50)
                        ),
                        child: Text("Add Product"))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
