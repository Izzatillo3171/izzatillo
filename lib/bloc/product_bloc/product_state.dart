import 'package:equatable/equatable.dart';
import '../../data/models/form_status.dart';
import '../../data/models/product_model.dart';


class ProductState extends Equatable {
  final List<ProductModel> products;
  final List<String> productName;
  final FormsStatus formsStatus;
  final String errorMessage;
  final String statusMessage;

   const ProductState({
     required this.productName,
    required this.formsStatus,
    required this.statusMessage,
    required this.errorMessage,
    required this.products,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    List<String>? productName,
    FormsStatus? formsStatus,
    String? errorMessage,
    String? statusMessage,
  }) {
    return ProductState(
      productName: productName ?? this.productName,
        products: products ?? this.products,
      formsStatus: formsStatus ?? this.formsStatus,
      statusMessage: statusMessage ?? this.statusMessage,
      errorMessage: errorMessage ?? this.errorMessage);

        }

  @override
  // TODO: implement props
  List<Object?> get props => [
    errorMessage,
    productName,
    statusMessage,
    formsStatus,
    products
  ];

}