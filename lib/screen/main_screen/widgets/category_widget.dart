import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/product_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../about_product/about_produt_screen.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
        List.generate(products.length ~/ 4, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return AboutProductScreen(
                        productModel:products[index]);
                  }));
            },
            child: Container(
              width: 140.w,
              height: 180.h,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.sp, color: AppColors.cDEE2E7)),
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              child: Column(
                children: [
                  Image.network(
                    products[index].imageUrl,
                    width: 98.w,
                    height: 98.h,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    products[index].productName,
                    style: AppTextStyle.interRegular.copyWith(
                        color: AppColors.black, fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.cFFE3E3,
                    ),
                    child: Text(
                      "-25%",
                      style: AppTextStyle.interRegular.copyWith(
                          color: AppColors.cEB001B,
                          fontSize: 14.sp),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
