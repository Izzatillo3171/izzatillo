import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../bloc/basket/basket_bloc.dart';
import '../../../bloc/basket/basket_event.dart';
import '../../../data/models/product_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';
class SendWidget extends StatelessWidget {
  const SendWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppImages.star),
              SizedBox(width: 10.w),
              Icon(Icons.circle, color: AppColors.c8B96A5, size: 6.sp),
              SizedBox(width: 10.w),
              Icon(Icons.message, size: 18.sp, color: AppColors.c8B96A5),
              SizedBox(width: 7.w),
              Text('32 reviews',
                  style: AppTextStyle.interRegular
                      .copyWith(color: AppColors.c8B96A5, fontSize: 13.sp)),
              SizedBox(width: 10.w),
              Icon(Icons.circle, color: AppColors.c8B96A5, size: 6.sp),
              SizedBox(width: 10.w),
              Icon(Icons.shopping_basket,
                  size: 18.sp, color: AppColors.c8B96A5),
              SizedBox(width: 10.w),
              Text(
                '154 sold',
                style: AppTextStyle.interRegular
                    .copyWith(color: AppColors.c8B96A5, fontSize: 13.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            productModel.productName,
            style: AppTextStyle.interSemiBold
                .copyWith(color: AppColors.c1C1C1C, fontSize: 16.sp),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Text(
                '\$${productModel.price}',
                style: AppTextStyle.interSemiBold
                    .copyWith(color: AppColors.cF4261A, fontSize: 16.sp),
              ),
              SizedBox(width: 5.w),
              Text(
                '(50-100 pcs)',
                style: AppTextStyle.interRegular
                    .copyWith(color: AppColors.c8B96A5, fontSize: 13.sp),
              )
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () async {
                  context
                      .read<BasketBloc>()
                      .add(AddBasketEvent(productModel: productModel));
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.c_1A72DD,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r))),
                child: Text(
                  "Send inquiry",
                  style: AppTextStyle.interMedium
                      .copyWith(color: AppColors.white, fontSize: 16.sp),
                )),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Text(
                "Condition",
                style: AppTextStyle.interSemiBold
                    .copyWith(color: AppColors.c8B96A5, fontSize: 16.sp),
              ),
              SizedBox(width: 40.w),
              Text(
                'Brand new',
                style: AppTextStyle.interRegular
                    .copyWith(color: AppColors.c1C1C1C, fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                "Item num",
                style: AppTextStyle.interSemiBold
                    .copyWith(color: AppColors.c8B96A5, fontSize: 16.sp),
              ),
              SizedBox(width: 44.w),
              Text(
                productModel.itemNumber.toString(),
                style: AppTextStyle.interRegular
                    .copyWith(color: AppColors.c1C1C1C, fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(productModel.shortDescription,
              style: AppTextStyle.interRegular
                  .copyWith(color: AppColors.c1C1C1C, fontSize: 16.sp)),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
