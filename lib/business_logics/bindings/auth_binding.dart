import 'package:get/get.dart';
import 'package:tech_blink/business_logics/controllers/auth_controller.dart';

class AuthBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }

}