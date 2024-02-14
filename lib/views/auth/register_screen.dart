import 'package:agrolinc/view_model/auth_controller.dart';
import 'package:agrolinc/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.2),
            const Text(
              'Register to get started',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xff21A177),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Get.height * 0.05),
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xffE6FBDA)),
                ),
                labelText: 'Enter Your Name',
                prefixIconColor: const Color(0xff20A479),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            TextField(
              controller: controller.mobileControllerRegister,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.green),
                ),
                labelText: 'Enter Mobile Number',
                prefixIconColor: const Color(0xff20A479),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.green),
                ),
                labelText: 'Enter Your Email',
                prefixIconColor: const Color(0xff20A479),
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            controller.loading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.orange,
                      strokeWidth: 4,
                    ),
                  )
                : SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.fetchRegister();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff41AC1D)),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have Account?',
                  style: TextStyle(color: Color(0xff61B046), fontSize: 18),
                ),
                SizedBox(height: Get.height * 0.05),
                InkWell(
                  onTap: () {
                    Get.to(() => const LoginScreen());
                  },
                  child: const Text(
                    ' Sign In',
                    style: TextStyle(
                      color: Color(0xff23A477),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
