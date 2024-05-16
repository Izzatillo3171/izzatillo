import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.white,
          border: Border.all(width: 1.sp,color: AppColors.c8B96A5)
      ),
      child: Column(children: [
        Row(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.cC6F3F1,
            ),
            child: Center(child: Text("R",style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.c4CA7A7
            ),),),
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Supplier",style: AppTextStyle.interRegular.copyWith(
                color: AppColors.c8B96A5,fontSize: 16.sp,
              ),),
              Text("Guanjoi Trading LLC",style: AppTextStyle.interRegular.copyWith(
                color: AppColors.c8B96A5,fontSize: 16.sp,
              ),),
            ],),
          const Spacer(),
          IconButton(onPressed: (){}, icon:Icon(Icons.navigate_next,size: 30.sp,color: AppColors.c8B96A5,))
        ],),
        SizedBox(height: 12.h,),
        Container(
          width:double.infinity,color: AppColors.c8B96A5,height: 1.h,
        ),
        SizedBox(height: 12.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              const Icon(Icons.flag),
              SizedBox(width: 5.w,),
              Text("Germany",style: AppTextStyle.interRegular.copyWith(
                color: AppColors.c8B96A5,fontSize: 16.sp,
              )),
            ],),
            Row(children: [
              Icon(Icons.verified_user_rounded,color: AppColors.c8B96A5,size: 20.sp,),
              SizedBox(width: 6.w,),
              Text("Verified ",style: AppTextStyle.interRegular.copyWith(
                color: AppColors.c8B96A5,fontSize: 16.sp,
              )),
            ],),
            Row(children: [
              Icon(Icons.language,size: 20.sp,color: AppColors.c8B96A5,),
              SizedBox(width: 5.w,),
              Text("Shipping",style: AppTextStyle.interRegular.copyWith(
                color: AppColors.c8B96A5,fontSize: 16.sp,
              ))
            ],),
          ],)
      ],),
    );
  }
}
