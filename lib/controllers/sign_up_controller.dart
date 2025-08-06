import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokemon_ui/res/app_colors.dart';
import 'package:pokemon_ui/view/sign_in/sign_in_screen.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final firstName = ''.obs;
  final lastName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  final isLoading = false.obs;
  final obscurePassword = true.obs;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  File? profileImage;
  final picker = ImagePicker();

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      update(); // If UI depends on profile image
    }
  }

  Future<void> signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        // 1. Create Firebase Auth user
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );

        User? user = userCredential.user;

        // 2. Store user data in Firestore
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
                'uid': user.uid,
                'first_name': firstNameController.text.trim(),
                'last_name': lastNameController.text.trim(),
                'email': emailController.text.trim(),
                'password': passwordController.text.trim(),
                'created_at': FieldValue.serverTimestamp(),
              });

          Get.snackbar(
            'Success',
            'Account created successfully!',
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColors.whiteColor,
            colorText: AppColors.blackColor,
          );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'Something went wrong';
        if (e.code == 'email-already-in-use') {
          errorMessage = 'Email already in use';
        } else if (e.code == 'weak-password') {
          errorMessage = 'Password is too weak';
        }

        Get.snackbar(
          'Error',
          errorMessage,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: AppColors.blackColor,
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Unexpected error occurred',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: AppColors.blackColor,
        );
      }

      isLoading.value = false;
    }
  }
}
