import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasan_shop/controller/home_controller.dart';

import 'add_product_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text("Hasan Shop Admin",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemCount: 10,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Colors.deepOrangeAccent
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Name"),
                              Text("Price", style: TextStyle(
                                  fontSize: 12, color: Colors.black54),),
                            ],
                          ),
                          IconButton(onPressed: () {
                            ctrl.testMethod();
                          },
                              icon: Icon(Icons.delete_forever)),
                        ],
                      ),
                    )
                );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddProductPage());
          },
          foregroundColor: Colors.deepOrangeAccent,
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
