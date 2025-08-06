import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pokemon_ui/controllers/add_collections_model.dart';
import 'package:pokemon_ui/controllers/collections_controller.dart';
import 'package:pokemon_ui/res/app_colors.dart';
import 'package:pokemon_ui/utils/utils.dart';

class AddCollectionScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController collectedController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  AddCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionsController controller = Get.put(CollectionsController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 20.sp,
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          'Add Collection',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            TextFormField(
              controller: nameController,
              decoration: inputDecoration('Collection Name'),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              controller: collectedController,
              keyboardType: TextInputType.number,
              decoration: inputDecoration('Collected Item'),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: totalController,
              keyboardType: TextInputType.number,
              decoration: inputDecoration('Total Items'),
            ),
            SizedBox(height: 20.h),
            Obx(() {
              return SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final collected =
                        int.tryParse(collectedController.text) ?? 0;
                    final total = int.tryParse(totalController.text) ?? 1;
                    if (name.isEmpty) {
                      Get.snackbar('Error', 'Collection name is required');
                      return;
                    }
                    final model = AddCollectionsModel(
                      name: name,
                      collectedItems: collected,
                      totalItems: total,
                    );
                    controller.isLoading.value = true;
                    await controller.addCollectionToFirebase(model);
                    controller.isLoading.value = false;
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child:
                      controller.isLoading.value
                          ? CircularProgressIndicator(
                            color: AppColors.whiteColor,
                            strokeWidth: 3.w,
                          )
                          : Text(
                            'Save Collection',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
