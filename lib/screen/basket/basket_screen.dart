import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzatillo/screen/basket/widget/cart_widget.dart';
import '../../bloc/basket/basket_bloc.dart';
import '../../bloc/basket/basket_event.dart';
import '../../bloc/basket/basket_state.dart';
import '../../data/models/product_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  double sum=0;
  @override
  void initState() {
    sum=26;
    context.read<BasketBloc>().add(GetBasketEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping cart"),
      ),
      body: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
          if(state.products.isEmpty){
            return const SizedBox();
          }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  ...List.generate(state.products.length, (index) {
                    if(index==0){
                      sum=26;
                    }
                    sum+=state.products[index].count*state.products[index].price;
                    return CartContainer(
                      productModel: state.products[index],
                      onTap: () {
                        int count = state.products[index].count - 1;
                        ProductModel pro = state.products[index];
                        if (state.products[index].count > 1) {
                          pro = pro.copyWith(count: count);
                        }
                        else{
                          context.read<BasketBloc>().add(DeleteBasketEvent(productDocId:state.products[index].userId));
                        }
                        context
                            .read<BasketBloc>()
                            .add(UpdateBasketEvent(productModel: pro));
                      },
                      onTapPlus: () {
                        int count = state.products[index].count + 1;
                        ProductModel pro = state.products[index];
                        if (state.products[index].count < 10) {
                          pro = pro.copyWith(count: count);
                        }
                        context
                            .read<BasketBloc>()
                            .add(UpdateBasketEvent(productModel: pro));
                      },
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Items(${state.products.length})",
                              style: AppTextStyle.interMedium.copyWith(
                                  color: Colors.grey.shade500, fontSize: 16.sp)),
                          Text("Shipping",
                              style: AppTextStyle.interMedium.copyWith(
                                  color: Colors.grey.shade500, fontSize: 16.sp)),
                          Text("Tax ",
                              style: AppTextStyle.interMedium.copyWith(
                                  color: Colors.grey.shade500, fontSize: 16.sp)),
                          Text("Total",
                              style: AppTextStyle.interMedium.copyWith(
                                  color: AppColors.black, fontSize: 16.sp)),
                        ],
                      ),
                      SizedBox(width: 60.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\$${state.products[0].price}",
                              style: AppTextStyle.interMedium.copyWith(
                                  color: AppColors.black, fontSize: 16.sp)),
                          Text("\$20",
                              style: AppTextStyle.interMedium.copyWith(
                                  color: AppColors.black, fontSize: 16.sp)),
                          Text("\$6",
                              style: AppTextStyle.interMedium.copyWith(
                                  color: AppColors.black, fontSize: 16.sp)),
                          Text(
                              (sum==26)?"\$0":"\$$sum",
                              style: AppTextStyle.interMedium.copyWith(
                                  color: AppColors.black, fontSize: 16.sp))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              )),
                          child: Text(
                            "Checkout(${state.products.length} items)",
                            style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.white, fontSize: 16.sp),
                          ))),
                  SizedBox(height: 30.h,)
                ],
              ),
            );
        },
      ),
    );
  }
}
