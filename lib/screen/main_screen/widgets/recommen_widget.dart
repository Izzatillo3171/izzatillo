import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/product_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key, required this.product});
  final List<ProductModel> product;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 8.w,
      mainAxisSpacing: 8.h,childAspectRatio: 0.84,
      shrinkWrap: true,
      crossAxisCount: 2,children:List.generate(4, (index){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),
        margin: EdgeInsets.only(left: (index%2==0?12.w:0),right:(index%2==1?12.w:0)),
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
            Center(child: Image.network(product[index].imageUrl,width: 120.w,height: 120.h,)),
            SizedBox(height: 10.h,),
            Text('\$${product[index].price}',style: AppTextStyle.interMedium.copyWith(
              color: AppColors.c1C1C1C,fontSize: 16.sp,
            ),),
            Text(product[index].productName,style: AppTextStyle.interMedium.copyWith(
              color: AppColors.c1C1C1C,fontSize: 16.sp,
            ))
          ],
        ),
      );
    }),);
  }
}
