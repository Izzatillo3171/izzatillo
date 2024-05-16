import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/product_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../about_product/about_produt_screen.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...List.generate(products.length, (index) {
          ProductModel product = products[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AboutProductScreen(
                  productModel: product,
                );
              }));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 1.sp, color: AppColors.c8B96A5),
                  color: AppColors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(product.imageUrl, width: 120.h, height: 120.w),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.productName,
                        style: AppTextStyle.interRegular.copyWith(
                            color: AppColors.c505050, fontSize: 16.sp),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "\$${product.price.toString()}",
                        style: AppTextStyle.interSemiBold
                            .copyWith(color: AppColors.black, fontSize: 16.sp),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          SvgPicture.asset(AppImages.star),
                          SizedBox(width: 5.w),
                          Text('7.5',
                              style: AppTextStyle.interRegular.copyWith(
                                  color: AppColors.cFF9017, fontSize: 13.sp)),
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.circle,
                            color: AppColors.c8B96A5,
                            size: 6.sp,
                          ),
                          SizedBox(width: 5.w),
                          Text('${Random().nextInt(1000)+100} orders',
                              style: AppTextStyle.interRegular.copyWith(
                                  color: AppColors.c8B96A5, fontSize: 13.sp)),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text('Free shipping',
                          style: AppTextStyle.interRegular.copyWith(
                              color: AppColors.c_00B517, fontSize: 13.sp))
                    ],
                  )
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}
