import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_ui/res/app_assets.dart';
import 'package:pokemon_ui/res/app_colors.dart';
import 'package:pokemon_ui/view/pokemon/pokemon_screen.dart';
import 'package:pokemon_ui/view/widgets/custom_appbar.dart';

class ForSaleScreen extends StatefulWidget {
  const ForSaleScreen({super.key});

  @override
  State<ForSaleScreen> createState() => _ForSaleScreenState();
}

class _ForSaleScreenState extends State<ForSaleScreen> {
  final List<CardItem> items = [
    CardItem(
      imagePath: AppAssets.ninetaleIconPng,
      title: 'Ninetales',
      subtitle: 'Base Set 12',
    ),
    CardItem(
      imagePath: AppAssets.squirtleIconPng,
      title: 'Squirtle',
      subtitle: 'Base Set 63',
    ),
    CardItem(
      imagePath: AppAssets.pikachuIconPng,
      title: 'Pikachu',
      subtitle: 'Base Set 12',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: 'For Sale'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Sort by',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffE6DFBE54),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Image.asset(
                        AppAssets.iosBottomIconPng,
                        height: 12.h,
                        width: 12.w,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'See all',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffE6DFBE54).withValues(alpha: 0.33),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Image.asset(
                        AppAssets.iosBottomIconPng,
                        height: 12.h,
                        width: 12.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.iconColor.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.pokemonContainerColor.withValues(
                            alpha: 0.55,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 8.r,
                                      backgroundColor: const Color(
                                        0xffE6DFBE,
                                      ).withValues(alpha: 0.33),
                                      child: const Center(
                                        child: Icon(Icons.add, size: 12),
                                      ),
                                    ),
                                    Text(
                                      'add',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelSmall!.copyWith(
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Remove',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelSmall!.copyWith(
                                    fontSize: 8,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            // Image placeholder
                            Container(
                              width: double.maxFinite,
                              height: 100,
                              color: AppColors.backgroundColor,
                              child: Image.asset(
                                items[index].imagePath,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Expanded(
                              // This ensures remaining space is used without overflow
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$20',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Text(
                                        'Buy',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
