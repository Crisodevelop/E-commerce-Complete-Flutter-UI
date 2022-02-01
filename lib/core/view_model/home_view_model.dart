import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/category_model.dart';
class HomeViewModel extends GetxController {

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

   HomeViewModel() {
    getCategory();
  }

  final CollectionReference <Map<dynamic, dynamic>> _categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categories');

   getCategory() async {
   _categoryCollectionRef.get().then((value) {
     print(value.docs[0].data());
     print('ooooooooooooooooooooooooooooooooo');
      for (int i = 0; i < value.docs.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data() as Map<String, dynamic>));
      }
      update();
    });
   }

}