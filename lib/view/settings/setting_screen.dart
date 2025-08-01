import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  List<settingModel> cardItems = [
    settingModel(
      image: AppAssets.accountIconPng,
      heading: 'Account',
      title: 'Alex Morgan:',
      subtitle: 'alex@gmail.com',
    ),
    settingModel(
      image: AppAssets.prefrencesIconPng,
      heading: 'Prefrences',
      title: 'Theme: Dark Mode',
      subtitle: 'Notifications: Enabled',
    ),
    settingModel(
      image: AppAssets.privacyIconPng,
      heading: 'Privacy Settings',
      title: 'Password',
      subtitle: 'Change Password..',
    ),
    settingModel(
      image: AppAssets.actionsIconPng,
      heading: 'Account Actions',
      title: 'Notification Settings',
      subtitle: 'Logout',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: 'Settings'),
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 50.w, top: 16.h),
          child: ListView.builder(
            itemCount: cardItems.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final item = cardItems[index];
              return Container(
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.heading,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              fontSize: 18.sp,
                            ),
                          ),
                          // const SizedBox(height: 2),
                          Text(
                            item.title,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: Color(0xff373737),
                            ),
                          ),
                          Text(
                            item.subtitle,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: Color(0xff373737),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
