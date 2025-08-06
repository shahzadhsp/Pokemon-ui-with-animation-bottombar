import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_ui/controllers/add_collections_model.dart';
import 'package:pokemon_ui/res/app_colors.dart';

class CollectionsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  var collections = <AddCollectionsModel>[].obs;

  Future<void> fetchCollections() async {
    try {
      final snapshot =
          await _firestore
              .collection('collections')
              .orderBy('createdAt', descending: true)
              .get();
      collections.value =
          snapshot.docs.map((doc) {
            final data = doc.data();
            return AddCollectionsModel(
              name: data['name'] ?? '',
              collectedItems: data['collectedItems'] ?? 0,
              totalItems: data['totalItems'] ?? 1,
            );
          }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch collections: $e');
    }
  }

  // Add Collections
  Future<void> addCollectionToFirebase(AddCollectionsModel model) async {
    try {
      await _firestore.collection('collections').add({
        'name': model.name,
        'collectedItems': model.collectedItems,
        'totalItems': model.totalItems,
        'createdAt': FieldValue.serverTimestamp(),
      });

      Get.snackbar(
        'Success',
        'Collection added successfully',
        backgroundColor: AppColors.whiteColor,
        colorText: AppColors.blackColor,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add collection: $e',
        backgroundColor: Colors.red,
        colorText: AppColors.blackColor,
      );
    }
  }
}
