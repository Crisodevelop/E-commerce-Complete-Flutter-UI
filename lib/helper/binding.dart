
import 'package:get/get.dart';
import 'package:shop_app/core/auth/google_sigin.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
      Get.lazyPut(() => GoogleSigIn());
  }

}