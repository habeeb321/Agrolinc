import 'package:agrolinc/repository/api_service.dart';
import 'package:agrolinc/views/auth/otp_screen.dart';
import 'package:agrolinc/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileControllerRegister = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileControllerLogin = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final loading = false.obs;
  final box = GetStorage();

  fetchRegister() async {
    loading.value = true;
    Map<String, dynamic>? result = await ApiService.getRegister(
      name: nameController.text,
      mobile: mobileControllerRegister.text,
      email: emailController.text,
    );
    if (result != null) {
      if (result['status'] == true) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.snackbar(
          'Error',
          "${result['msg']}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }

    loading.value = false;
  }

  fetchLogin() async {
    loading.value = true;
    Map<String, dynamic>? result =
        await ApiService.getLogin(mobile: mobileControllerLogin.text);
    if (result != null) {
      box.write('userId', result['userId']);
      update();
      if (result['status'] == true) {
        Get.offAll(() => const OtpScreen());
      } else {
        Get.snackbar(
          'Error',
          "${result['msg']}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    loading.value = false;
  }

  fetchOtp() async {
    loading.value = true;
    var userId = box.read('userId');
    Map<String, dynamic>? result =
        await ApiService.getOtp(otp: otpController.text, userId: userId);
    if (result != null) {
      if (result['status'] == true) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.snackbar(
          'Error',
          "${result['msg']}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    loading.value = false;
  }
}
