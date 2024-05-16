import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/constants/app_constants.dart';
import '../models/network.dart';
import '../models/product_model.dart';

class BasketRepository {
  Future<NetworkResponse> addBasket(ProductModel productModel) async {

    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection(AppConstants.baskets).get();

      List<ProductModel> products = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      bool isExists = false;
      for (var element in products) {
        if (element.userId == productModel.userId) {
          isExists = true;
          break;
        }}
      if (!isExists){
        productModel=productModel.copyWith(
          count: productModel.count+1
        );
        DocumentReference documentReference = await FirebaseFirestore.instance
              .collection(AppConstants.baskets)
              .add(productModel.toJson());
          await FirebaseFirestore.instance
              .collection(AppConstants.baskets)
              .doc(documentReference.id)
              .update({"userId": documentReference.id});
          return NetworkResponse(data: 'success');
    }} on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "ERROR");
  }

  Future<NetworkResponse> updateBasket(ProductModel productModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.baskets)
          .doc(productModel.userId)
          .update(productModel.toJsonForUpdate());
      return NetworkResponse(data: 'success');
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> deleteBasket(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.baskets)
          .doc(docId)
          .delete();
      return NetworkResponse(data: 'success');
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Stream<List<ProductModel>> getBasketDatabase() {
    return FirebaseFirestore.instance
        .collection(AppConstants.baskets)
        .snapshots()
        .map((event){
      return event.docs.map((doc){
        return ProductModel.fromJson(doc.data());
      }).toList();
    });
  }
}
