import 'package:equatable/equatable.dart';
import '../../data/models/form_status.dart';
import '../../data/models/product_model.dart';


class BasketState extends Equatable {
  final List<ProductModel> products;
  final FormsStatus formsStatus;
  final String errorMessage;
  final String statusMessage;

   const BasketState({
    required this.formsStatus,
    required this.statusMessage,
    required this.errorMessage,
    required this.products,
  });

  BasketState copyWith({
    List<ProductModel>? products,
    FormsStatus? formsStatus,
    String? errorMessage,
    String? statusMessage,
  }) {
    return BasketState(
        products: products ?? this.products,
      formsStatus: formsStatus ?? this.formsStatus,
      statusMessage: statusMessage ?? this.statusMessage,
      errorMessage: errorMessage ?? this.errorMessage);

        }

  @override
  // TODO: implement props
  List<Object?> get props => [
    errorMessage,
    statusMessage,
    formsStatus,
    products
  ];

}