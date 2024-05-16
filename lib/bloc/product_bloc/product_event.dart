import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';

abstract class ProductEvent extends Equatable{}

class  AddProductEvent extends ProductEvent{

  final ProductModel productModel;
  AddProductEvent({
    required this.productModel
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    productModel
  ];
}

class  DeleteProductEvent extends ProductEvent{

  final String productDocId;
  DeleteProductEvent({
    required this.productDocId
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    productDocId
  ];
}

class  UpdateProductEvent extends ProductEvent{

  final ProductModel productModel;
  UpdateProductEvent({
    required this.productModel
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    productModel
  ];
}
class  GetProductEvent extends ProductEvent{
  final String category;
  final String productName;
  final String search;
  GetProductEvent({required this.category,required this.productName,required this.search});
  @override
  // TODO: implement props
  List<Object?> get props => [category,productName,search];
}

