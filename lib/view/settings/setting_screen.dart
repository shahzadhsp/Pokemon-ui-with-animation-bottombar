import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_ui/controllers/setting_controller.dart';
import 'package:pokemon_ui/controllers/theme_controller.dart';
import 'package:pokemon_ui/models/card_items.dart';
import 'package:pokemon_ui/res/app_assets.dart';
import 'package:pokemon_ui/res/app_colors.dart';
import 'package:pokemon_ui/view/widgets/custom_appbar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final SettingController settingController = Get.put(SettingController());
  final ThemeController themeController = Get.put(ThemeController());
  void _showChangePasswordDialog(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: oldPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Old Password'),
                  validator:
                      (value) => value!.isEmpty ? 'Enter old password' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'New Password'),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'New password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  await settingController.changePassword(
                    oldPasswordController.text,
                    newPasswordController.text,
                  );
                }
              },
              child: const Text('Change'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      settingController.fetchUserData(userId);
      settingController.fetchUserPassword(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 50.w, top: 16.h),
        child: Obx(() {
          final cardItems = [
            settingModel(
              image: AppAssets.accountIconPng,
              heading: 'Account',
              title: settingController.userName.value,
              subtitle: settingController.userEmail.value,
            ),
            settingModel(
              image: AppAssets.prefrencesIconPng,
              heading: 'Prefrences',
              title:
                  themeController.isDarkMode
                      ? 'Theme: Dark Mode'
                      : 'Theme: Light Mode',
              subtitle: 'Notifications: Enabled',
            ),
            settingModel(
              image: AppAssets.privacyIconPng,
              heading: 'Privacy Settings',
              title: 'Password${settingController.password.value}',
              subtitle: 'Change Password..',
            ),
            settingModel(
              image: AppAssets.actionsIconPng,
              heading: 'Account Actions',
              title: 'Notification Settings',
              subtitle: 'Logout',
            ),
          ];

          return ListView.builder(
            itemCount: cardItems.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final item = cardItems[index];

              return InkWell(
                onTap: () {
                  if (index == 1) {
                    themeController.toggleTheme();
                  } else if (index == 3) {
                    settingController.logoutUser(context);
                  } else if (index == 2) {
                    _showChangePasswordDialog(context);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Image.asset(item.image, height: 40, width: 40),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.heading,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: AppColors.blackColor,
                            ),
                          ),
                          Text(
                            item.title,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: const Color(0xff373737)),
                          ),
                          Text(
                            item.subtitle,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: const Color(0xff373737)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
