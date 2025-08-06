import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_ui/controllers/setting_controller.dart';
import 'package:pokemon_ui/res/app_colors.dart';
import 'package:pokemon_ui/view/collections/bottom_bar/bottom_navigation_bar.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var obscurePassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> signIn(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Get.snackbar(
        "Success",
        "Logged in successfully!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.whiteColor,
        colorText: AppColors.blackColor,
      );
      Get.put(SettingController());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainNavigation()),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "Sign in failed",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: AppColors.blackColor,
      );
    }

    isLoading.value = false;
  }
}
