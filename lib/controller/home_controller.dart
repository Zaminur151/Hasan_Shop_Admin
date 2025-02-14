import 'package:get/get.dart';

class HomeController extends GetxController {
  String test ='test text';

  @override
  void onInit() {
    super.onInit();
  }

  testMethod(){
    print(test??"");
  }
}