import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izzatillo/bloc/product_bloc/product_event.dart';
import 'package:izzatillo/bloc/product_bloc/product_state.dart';
import '../../data/models/form_status.dart';
import '../../data/models/network.dart';
import '../../data/models/product_model.dart';
import '../../data/repository/product_repositroy.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.productRepository})
      : super(const ProductState(
          formsStatus: FormsStatus.pure,
          statusMessage: '',
          errorMessage: '',
          productName: [],
          products: [],
        )) {
    on<AddProductEvent>(addProduct);
    on<GetProductEvent>(getProduct);
    on<UpdateProductEvent>(updateProduct);
    on<DeleteProductEvent>(deleteProduct);
  }

  final ProductRepository productRepository;

  addProduct(AddProductEvent event, emit) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse networkResponse =
        await productRepository.addProduct(event.productModel);
    if (networkResponse.errorText.isNotEmpty) {
      emit(state.copyWith(
          formsStatus: FormsStatus.success, statusMessage: "added"));
    } else {
      emit(state.copyWith(
          formsStatus: FormsStatus.error,
          errorMessage: networkResponse.errorText));
    }
  }

  getProduct(GetProductEvent event, Emitter emit) async {
    List<ProductModel> all = await productRepository.getProductDatabase().first;
    List<String> allProductName = ["All Products"];
    List<ProductModel> allProducts = [];
    for (var i in all) {
      if (i.category == event.category) {
        allProducts.add(i);
        allProductName.add(i.productName);
      }
    }
    if (event.category == 'All Categories' &&
        event.productName == 'All Products') {
      for (var i in all) {
        allProductName.add(i.productName);
      }
      emit(state.copyWith(
          products: all
              .where((element) => element.productName
                  .toLowerCase()
                  .contains(event.search.toLowerCase()))
              .toList(),
          productName: allProductName));
    } else if (event.category == 'All Categories' &&
        event.productName != 'All Products') {
      for (var i in all) {
        allProductName.add(i.productName);
      }
      emit(state.copyWith(
          products: all
              .where((element) => element.productName == event.productName)
              .toList()
              .where((element) => element.productName
                  .toLowerCase()
                  .contains(event.search.toLowerCase()))
              .toList(),
          productName: allProductName));
    } else {
      if (event.productName == 'All Products') {
        List<ProductModel> pr = allProducts
            .where((e) => e.productName
                .toLowerCase()
                .contains(event.search.toLowerCase()))
            .toList();
        emit(state.copyWith(productName: allProductName, products: pr));
      } else {
        List<ProductModel> pl = [];
        for (var i in allProducts) {
          if (i.productName == event.productName) {
            pl.add(i);
          }
        }
        emit(state.copyWith(
            products: pl
                .where((element) => element.productName
                    .toLowerCase()
                    .contains(event.search.toLowerCase()))
                .toList(),
            productName: allProductName));
      }
    }
  }

  updateProduct(UpdateProductEvent event, emit) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse networkResponse =
        await productRepository.updateProduct(event.productModel);
    if (networkResponse.errorText.isNotEmpty) {
      emit(state.copyWith(formsStatus: FormsStatus.success));
    } else {
      emit(state.copyWith(
          formsStatus: FormsStatus.error,
          errorMessage: networkResponse.errorText));
    }
  }

  deleteProduct(DeleteProductEvent event, emit) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse networkResponse =
        await productRepository.deleteProduct(event.productDocId);
    if (networkResponse.errorText.isNotEmpty) {
      emit(state.copyWith(formsStatus: FormsStatus.success));
    } else {
      emit(state.copyWith(
          formsStatus: FormsStatus.error,
          errorMessage: networkResponse.errorText));
    }
  }
}
