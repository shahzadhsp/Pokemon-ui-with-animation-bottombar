import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pokemon_ui/controllers/theme_controller.dart';
import 'package:pokemon_ui/models/inventory_model.dart';
import 'package:pokemon_ui/res/app_colors.dart';
import 'package:pokemon_ui/view/widgets/custom_appbar.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});
  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final _themeController = Get.put(ThemeController());
  List<InventoryModel> items = [
    InventoryModel(name: 'Potion', type: 'Health', value: 256.00, quantity: 5),
    InventoryModel(
      name: 'Pikachu',
      type: 'Electric',
      value: 25.99,
      quantity: 10,
    ),
    InventoryModel(name: 'Charmander', type: 'Fire', value: 80.50, quantity: 5),
    InventoryModel(
      name: 'Balbasaur',
      type: 'Grass',
      value: 150.00,
      quantity: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: 'Inventory'),
      body: Column(
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  children: [
                    Text(
                      'Total Cards:',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: 'Inter',
                        color:
                            _themeController.isDarkMode
                                ? Colors.white
                                : AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffE6DFBE54).withValues(alpha: 0.33),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        '132',
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color:
                              _themeController.isDarkMode
                                  ? Colors.white
                                  : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: Row(
                  children: [
                    Text(
                      'Value',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: 'Inter',
                        color:
                            _themeController.isDarkMode
                                ? Colors.white
                                : AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffE6DFBE54).withValues(alpha: 0.33),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        '\$256.00',
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color:
                              _themeController.isDarkMode
                                  ? Colors.white
                                  : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.containerColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CardInfoRow(
                                label: 'Name:',
                                value: items[index].name,
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CardInfoRow(
                                    label: 'Type:',
                                    value: items[index].type,
                                  ),
                                  CardInfoRow(
                                    label: 'Qty:',
                                    value: items[index].quantity.toString(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              CardInfoRow(
                                label: 'Value:',
                                value: items[index].value.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CardInfoRow extends StatelessWidget {
  final String label;
  final String value;
  const CardInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final _themeController = Get.put(ThemeController());
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontFamily: 'Inter',
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Color(0xffE6DFBE54).withValues(alpha: 0.33),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color:
                  _themeController.isDarkMode
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
