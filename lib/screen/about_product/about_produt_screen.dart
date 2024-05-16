import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izzatillo/screen/about_product/widget/info_widget.dart';
import 'package:izzatillo/screen/about_product/widget/send_widget.dart';
import 'package:izzatillo/screen/about_product/widget/similar_products_widget.dart';
import '../../bloc/basket/basket_bloc.dart';
import '../../bloc/basket/basket_state.dart';
import '../../data/models/product_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
import '../basket/basket_screen.dart';

class AboutProductScreen extends StatefulWidget {
  const AboutProductScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<AboutProductScreen> createState() => _AboutProductScreenState();
}

class _AboutProductScreenState extends State<AboutProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return const CartScreen();
            }));
          }, icon:SvgPicture.asset(AppImages.basket,width: 24.w,height: 24.h,)),
          IconButton(onPressed: (){}, icon:SvgPicture.asset(AppImages.person,width: 24.w,height: 24.h,)),
        ],
      ),
      body:BlocBuilder<BasketBloc,BasketState>(
        builder: (context,state){
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.productModel.imageUrl,width:MediaQuery.of(context).size.width,height: 305.h,fit: BoxFit.cover,),
                SizedBox(height: 15.h,),
                SendWidget(productModel: widget.productModel),
                const InfoWidget(),
                SizedBox(height: 20.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Text('Similar products',style: AppTextStyle.interSemiBold.copyWith(
                    color: AppColors.c1C1C1C,fontSize:18.sp,
                  ),),
                ),
                SizedBox(height: 20.h,),
                SimilarProductWidget(categoryModel:[widget.productModel],),
                SizedBox(height: 40.h,),
              ],
            ),
          );
        },
      )
    );
  }
}
