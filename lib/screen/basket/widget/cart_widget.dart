import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/product_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class CartContainer extends StatelessWidget {
  const CartContainer(
      {super.key,
      required this.productModel,
      required this.onTap,
      required this.onTapPlus});

  final ProductModel productModel;
  final VoidCallback onTap;
  final VoidCallback onTapPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white), // Set the background color here
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(productModel.productName,style: AppTextStyle.interMedium.copyWith(
              color: AppColors.c8B96A5,fontSize: 16.sp,
            ),),
            subtitle: Text(productModel.shortDescription,style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.c8B96A5,fontSize: 16.sp,
            ),),
            leading: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white),
              child: Center(child: Image.network(productModel.imageUrl,fit: BoxFit.cover,)),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, size: 25.sp),
            ),
            onTap: () {
              // Handle tap
            },
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              bottomLeft: Radius.circular(8.r)
                            ),
                            border:
                            Border.all(width: 2.w, color: AppColors.c8B96A5)),
                        child: const Center(
                            child:Icon(Icons.minimize)),
                      ),
                    ),
                    Container(
                      width: 60.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.zero,
                          border:
                              Border.all(width: 2.w, color: AppColors.c8B96A5)),
                      child: Center(
                          child: Text(
                        productModel.count.toString(),
                        style: AppTextStyle.interMedium.copyWith(fontSize: 16.sp),
                      )),
                    ),
                    InkWell(
                      onTap: onTapPlus,
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r),
                            ),
                            border:
                            Border.all(width: 2.w, color: AppColors.c8B96A5)),
                        child: const Center(
                            child:Icon(Icons.add)),
                      ),
                    ),
                  ],
                ),
                Text("\$${productModel.price}",
                    style: AppTextStyle.interMedium
                        .copyWith(color: AppColors.black, fontSize: 18.w))
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
