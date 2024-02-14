import 'package:agrolinc/view_model/auth_controller.dart';
import 'package:agrolinc/views/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.1),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xff21A177),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Get.height * 0.02),
            const Text(
              'Stay Signed in with your account to make it easier',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: Get.height * 0.02),
            const Image(
              image: AssetImage('assets/icon.png'),
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
            SizedBox(height: Get.height * 0.05),
            TextField(
              controller: controller.mobileControllerLogin,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xffE6FBDA)),
                ),
                labelText: 'Mobile',
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
                        controller.fetchLogin();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff41AC1D)),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Color(0xff61B046), fontSize: 18),
                ),
                SizedBox(height: Get.height * 0.05),
                InkWell(
                  onTap: () {
                    Get.to(() => const RegisterScreen());
                  },
                  child: const Text(
                    ' Sign Up',
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
