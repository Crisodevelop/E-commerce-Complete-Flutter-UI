import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/services/home_services.dart';
import 'package:shop_app/models/category_model.dart';
class HomeViewModel extends GetxController {

 ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

   HomeViewModel() {
    getCategory();
  }

  // final CollectionReference <Map<dynamic, dynamic>> _categoryCollectionRef =
  // FirebaseFirestore.instance.collection('Categories');

   getCategory() async {
     _loading.value = true;
     HomeService().getCategory().then((value) {
     print('------Category-----');
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
         _loading.value = false;
      }
      update();
    });
   }

   
  // getBestSellingProducts() async {
  //   _loading.value = true;
  //   HomeService().getBestSelling().then((value) {
  //     for (int i = 0; i < value.length; i++) {
  //       _productModel.add(ProductModel.fromJson(value[i].data()));
  //       _loading.value = false;
  //     }
  //     print(_productModel.length);
  //     update();
  //   });
  // }

}