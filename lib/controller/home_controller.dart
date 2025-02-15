import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasan_shop/model/product/product.dart';

class HomeController extends GetxController {
  FirebaseFirestore fireStore=FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  bool? offer;
  String? brand;
  String? category;
  TextEditingController productNameCtl = TextEditingController();
  TextEditingController descriptionCtl = TextEditingController();
  TextEditingController imageCtl = TextEditingController();
  TextEditingController priceCtl = TextEditingController();

  List<Product> products =[];

  @override
  Future<void> onInit() async {
    collectionReference = fireStore.collection('products');
    await fetchProduct();
    super.onInit();
  }

  addProduct(){
    try {
      DocumentReference doc = collectionReference.doc();
      Product product= Product(
        id: doc.id,
        name: productNameCtl.text.trim(),
        description: descriptionCtl.text.trim(),
        image: imageCtl.text.trim(),
        brand: brand,
        category: category,
        isOffer: offer,
        price: double.tryParse(priceCtl.text.trim()),
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar("Success", "Product added successfully",colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(),colorText: Colors.red);
    }finally{
      update();
    }
  }

  fetchProduct()async{
    try {
      QuerySnapshot productSnapShot = await collectionReference.get();
      final List<Product> retrievedProduct= productSnapShot.docs.map((doc) =>
          Product.fromJson(doc.data() as Map<String,dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProduct);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(),colorText: Colors.red);
    }finally{
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      collectionReference.doc(id).delete();
      await fetchProduct();
      Get.snackbar("Success","Product deleted successfully",colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(),colorText: Colors.red);
    }
  }

  setDefaultValue(){
    productNameCtl.clear();
    descriptionCtl.clear();
    imageCtl.clear();
    priceCtl.clear();
    brand = 'Select brand';
    category = 'Select category';
    offer = false;
    update();
  }

}