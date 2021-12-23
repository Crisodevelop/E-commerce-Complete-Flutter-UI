
import 'package:get/get.dart';
import 'package:shop_app/models/auth/AuthController.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
      Get.lazyPut(() => AuthController());
  }

}