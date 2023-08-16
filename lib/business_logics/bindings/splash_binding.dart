import 'package:get/get.dart';
import 'package:tech_blink/business_logics/controllers/splash_controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}