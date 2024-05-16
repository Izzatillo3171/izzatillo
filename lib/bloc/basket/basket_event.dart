import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';
abstract class BasketEvent extends Equatable{}

class  AddBasketEvent extends BasketEvent{

  final ProductModel productModel;
  AddBasketEvent({
    required this.productModel
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    productModel
  ];
}

class  DeleteBasketEvent extends BasketEvent{

  final String productDocId;
  DeleteBasketEvent({
    required this.productDocId
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    productDocId
  ];
}

class  UpdateBasketEvent extends BasketEvent{

  final ProductModel productModel;
  UpdateBasketEvent({
    required this.productModel
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    productModel,
  ];
}
class  GetBasketEvent extends BasketEvent{
  GetBasketEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

