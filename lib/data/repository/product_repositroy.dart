import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/constants/app_constants.dart';
import '../models/network.dart';
import '../models/product_model.dart';

class ProductRepository {
  Future<NetworkResponse> addProduct(ProductModel productModel) async {
    try {
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection(AppConstants.products)
          .add(productModel.toJson());
      await FirebaseFirestore.instance
          .collection(AppConstants.products)
          .doc(documentReference.id)
          .update({"userId": documentReference.id});
      return NetworkResponse(data: 'success');
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> updateProduct(ProductModel productModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.products)
          .doc(productModel.userId)
          .update(productModel.toJsonForUpdate());
      return NetworkResponse(data: 'success');
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> deleteProduct(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.products)
          .doc(docId)
          .delete();
      return NetworkResponse(data: 'success');
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Stream<List<ProductModel>> getProductDatabase() {
    return FirebaseFirestore.instance
        .collection(AppConstants.products)
        .snapshots()
        .map((event){
      return event.docs.map((doc){
        return ProductModel.fromJson(doc.data());
      }).toList();
    });
  }
}
