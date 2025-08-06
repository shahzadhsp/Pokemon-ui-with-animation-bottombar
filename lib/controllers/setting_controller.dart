import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_ui/controllers/sign_in_controller.dart';
import 'package:pokemon_ui/res/app_colors.dart';
import 'package:pokemon_ui/view/sign_in/sign_in_screen.dart';

class SettingController extends GetxController {
  var userName = 'huma'.obs;
  var userEmail = 'huma@gmail.com'.obs;
  var password = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      fetchUserData(user.uid);
    }
  }

  Future<void> fetchUserData(String userId) async {
    try {
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();

      if (doc.exists) {
        final data = doc.data()!;
        userName.value =
            '${data['first_name'] ?? ''} ${data['last_name'] ?? ''}'.trim();
        userEmail.value = data['email'] ?? '';
      } else {
        userName.value = 'Unknown User';
        userEmail.value = 'Email not found';
      }
    } catch (e) {
      print('Error fetching user data: $e');
      userName.value = 'Error';
      userEmail.value = 'Error';
    }
  }

  // fetch user password
  Future<void> fetchUserPassword(String userId) async {
    try {
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();

      if (doc.exists) {
        final data = doc.data()!;
        password.value = data['password'] ?? 'No Password Found';
      } else {
        password.value = 'default';
      }
    } catch (e) {
      print('Error fetching user data: $e');
      userName.value = 'Error';
      userEmail.value = 'Error';
    }
  }

  void logoutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.snackbar(
        'Success',
        'Logged out successfully',
        backgroundColor: AppColors.whiteColor,
        colorText: AppColors.blackColor,
      );
      Get.delete<SignInController>();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    } catch (e) {
      Get.snackbar('Error', 'Logout failed: $e');
    }
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;
      final cred = EmailAuthProvider.credential(
        email: user!.email!,
        password: oldPassword,
      );

      // Reauthenticate
      await user.reauthenticateWithCredential(cred);
      // Update password
      await user.updatePassword(newPassword);
      // Save password to Firestore (if you're storing it — not recommended for production)
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
        {'password': newPassword},
      );
      // Fetch updated password
      await fetchUserPassword(user.uid);
      Get.snackbar(
        "Success",
        "Password changed successfully",
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.whiteColor,
        colorText: AppColors.blackColor,
      );
    }
  }
}
