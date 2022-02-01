
import 'package:get/get.dart';
import 'package:shop_app/core/auth/google_sigin.dart';
import 'package:shop_app/screens/home/home_screen.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
      Get.lazyPut(() => GoogleSigIn());
      Get.lazyPut(() => HomeScreen());
  }

}