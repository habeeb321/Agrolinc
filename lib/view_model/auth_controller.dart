import 'package:agrolinc/model/login_model.dart';
import 'package:agrolinc/repository/api_service.dart';
import 'package:agrolinc/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileControllerRegister = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileControllerLogin = TextEditingController();

  final loading = false.obs;
  LoginModel? loginModel;

  fetchRegister() async {
    loading.value = true;
    String? result = await ApiService.getRegister(
      name: nameController.text,
      mobile: mobileControllerRegister.text,
      email: emailController.text,
    );
    if (result == "Registered successfully") {
      Get.offAll(() => const HomeScreen());
    } else if (result == "Email already registered!") {
      Get.snackbar(
        'Error',
        'Email already registered!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error',
        "Please send name, mobile, role, and emailId!",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    loading.value = false;
  }

  fetchLogin() async {
    loading.value = true;
    LoginModel? result =
        await ApiService.getLogin(mobile: mobileControllerLogin.text);
    if (result != null) {
      loginModel = result;
      update();
      if (result.status == true) {
        Get.offAll(() => const HomeScreen());
      } else if (result.msg == "Mobile number not registered!") {
        Get.snackbar(
          'Error',
          "Mobile number not registered!",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          "Please provide mobile number!",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    loading.value = false;
  }
}
