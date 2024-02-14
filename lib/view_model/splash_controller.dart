import 'package:agrolinc/views/auth/login_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      3.0.seconds,
      () {
        Get.offAll(() => const LoginScreen());
      },
    );
    super.onInit();
  }
}
