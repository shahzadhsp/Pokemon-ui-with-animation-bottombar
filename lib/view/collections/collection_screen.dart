// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pokemon_ui/res/app_colors.dart';
// import 'package:pokemon_ui/view/collections/add_collection_screen.dart';

// class CollectionsScreen extends StatelessWidget {
//   const CollectionsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Padding(
//           padding: const EdgeInsets.only(bottom: 12),
//           child: Text(
//             'Your Collection',
//             style: Theme.of(context).textTheme.titleMedium!.copyWith(
//               color: AppColors.whiteColor,
//               fontWeight: FontWeight.w700,
//               fontFamily: 'Inter',
//             ),
//           ),
//         ),
//         backgroundColor: AppColors.primaryColor,
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: GridView.builder(
//                 itemCount: 4,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                   childAspectRatio: 1,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     padding: const EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: AppColors.containerColor,
//                       border: Border.all(color: AppColors.primaryColor),
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(color: Colors.black12, blurRadius: 4),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             'Collection ${index + 1}',
//                             style: Theme.of(
//                               context,
//                             ).textTheme.titleMedium!.copyWith(
//                               color: AppColors.blackColor,
//                               fontWeight: FontWeight.w700,
//                               fontFamily: 'Inter',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Stack(
//                           alignment: Alignment.center,

//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Container(
//                                 height: 50,
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.primaryColor.withValues(
//                                     alpha: 0.28,
//                                   ),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: Container(
//                                     height: 30,
//                                     width: 110,
//                                     decoration: BoxDecoration(
//                                       color: AppColors.containerColor,
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: Container(
//                                     height: 30,
//                                     width: 50,
//                                     decoration: BoxDecoration(
//                                       color: AppColors.primaryColor,
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       '20%',
//                                       style: Theme.of(
//                                         context,
//                                       ).textTheme.labelSmall!.copyWith(
//                                         fontFamily: 'Inter',
//                                         color: AppColors.whiteColor,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             '25/120',
//                             style: Theme.of(
//                               context,
//                             ).textTheme.bodyLarge!.copyWith(
//                               color: AppColors.blackColor,
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: EdgeInsets.only(bottom: 160.h, left: 50.w, right: 50.w),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AddCollectionScreen(),
//                   ),
//                 );
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryColor,
//                   borderRadius: BorderRadius.circular(8),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withValues(alpha: 0.2),
//                       blurRadius: 6,
//                       offset: Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 12,
//                       backgroundColor: AppColors.iconColor,
//                       child: Icon(Icons.add, color: AppColors.blackColor),
//                     ),
//                     SizedBox(width: 20.w),
//                     Text(
//                       'Add Collection',
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                         fontSize: 18.sp,
//                         color: AppColors.whiteColor,
//                         fontFamily: 'Inter',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pokemon_ui/controllers/collections_controller.dart';
import 'package:pokemon_ui/res/app_colors.dart';
import 'package:pokemon_ui/view/collections/add_collection_screen.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  final controller = Get.put(CollectionsController());
  @override
  void initState() {
    // Fetch collections when screen is built
    controller.fetchCollections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            'Your Collection',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.collections.isEmpty) {
                return Center(child: Text('No collections added yet.'));
              }

              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: GridView.builder(
                  itemCount: controller.collections.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final collection = controller.collections[index];
                    final percent = (collection.collectedItems /
                            collection.totalItems *
                            100)
                        .toStringAsFixed(0);

                    return Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              collection.name,
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium!.copyWith(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(
                                      0.28,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 30,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: AppColors.containerColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$percent%',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelSmall!.copyWith(
                                        fontFamily: 'Inter',
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '${collection.collectedItems}/${collection.totalItems}',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.copyWith(
                                color: AppColors.blackColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(bottom: 160.h, left: 50.w, right: 50.w),
            child: GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCollectionScreen(),
                  ),
                );
                // Refresh list after coming back
                controller.fetchCollections();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.iconColor,
                      child: Icon(Icons.add, color: AppColors.blackColor),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      'Add Collection',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.whiteColor,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
