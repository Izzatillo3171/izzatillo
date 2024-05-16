import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/form_status.dart';
import '../../data/models/network.dart';
import '../../data/models/product_model.dart';
import '../../data/repository/basket_repositroy.dart';
import 'basket_event.dart';
import 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent,BasketState> {
  BasketBloc({required this.basketRepository}) :super(
      const BasketState(formsStatus: FormsStatus.pure,
        statusMessage: '',
        errorMessage: '',
        products: [],)
  ){
    on<AddBasketEvent>(addBasket);
    on<GetBasketEvent>(getBasket);
    on<UpdateBasketEvent>(updateBasket);
    on<DeleteBasketEvent>(deleteBasket);
  }

  final BasketRepository basketRepository;
  addBasket(AddBasketEvent event,emit)async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse networkResponse = await basketRepository.addBasket(
        event.productModel);
    if (networkResponse.errorText.isNotEmpty) {
      emit(state.copyWith(
          formsStatus: FormsStatus.success, statusMessage: "added"));
    }
    else {
      emit(
          state.copyWith(
              formsStatus: FormsStatus.error,
              errorMessage: networkResponse.errorText
          )
      );
    }
  }
  getBasket(GetBasketEvent event,Emitter emit)async{
    await emit.onEach(
      basketRepository.getBasketDatabase(),
      onData:(List<ProductModel> pro){
        emit(state.copyWith(products: pro,));
      }
    );
    // List<ProductModel> all=await basketRepository.getBasketDatabase().first;
    //     await emit(
    //         state.copyWith(products: all,formsStatus:FormsStatus.success)
    //     );
  }



  updateBasket(UpdateBasketEvent event,emit)async{
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse networkResponse=await basketRepository.updateBasket(event.productModel);
    if(networkResponse.errorText.isNotEmpty){
      await emit(state.copyWith(formsStatus: FormsStatus.success));
    }
    else{
      await emit(
          state.copyWith(
              formsStatus: FormsStatus.error,
              errorMessage: networkResponse.errorText
          )
      );
    }
    add(GetBasketEvent());
  }

  deleteBasket(DeleteBasketEvent event,emit)async{
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse networkResponse=await basketRepository.deleteBasket(event.productDocId);
    if(networkResponse.errorText.isNotEmpty){
      emit(state.copyWith(formsStatus: FormsStatus.success));
    }
    else{
      emit(
          state.copyWith(
              formsStatus: FormsStatus.error,
              errorMessage: networkResponse.errorText
          )
      );
    }
  }
}