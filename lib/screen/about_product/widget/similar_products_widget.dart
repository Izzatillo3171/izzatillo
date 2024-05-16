import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/product_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
import '../about_produt_screen.dart';

class SimilarProductWidget extends StatelessWidget {
  const SimilarProductWidget({super.key, required this.categoryModel,});
  final List<ProductModel> categoryModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235.h,
      child:ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children:List.generate(categoryModel.length, (index){
        return InkWell(
          onTap: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
              return AboutProductScreen(productModel:categoryModel[index],);
            }));
          },
          child: Container(
            width: 150.w,
            padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                    width: 1.sp,color: AppColors.black.withOpacity(0.3)
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h,),
                Center(child: Image.network(categoryModel[index].imageUrl,width: 130.w,height: 125.h,)),
                SizedBox(height: 10.h,),
                Text('\$${categoryModel[index].price}',style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c1C1C1C,fontSize: 16.sp,
                ),),
                Text(categoryModel[index].productName,style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c1C1C1C,fontSize: 16.sp,
                ))
              ],
            ),
          ),
        );
      }),),
    );
  }
}