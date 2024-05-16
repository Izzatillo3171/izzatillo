import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';

class RecommendedInfoWidget extends StatelessWidget {
  const RecommendedInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [SizedBox(height: 160.h,
      child: Stack(children: [
        Image.asset(AppImages.image2,height: 160.h,),
        Positioned(
            left: 27.w,top: 30.h,right: 100.w,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("An easy way to send requests to all suppliers",style: AppTextStyle.interSemiBold.copyWith(
                    color: AppColors.white,fontSize: 18.sp
                ),),
                SizedBox(height: 17.h,),
                TextButton(onPressed: (){},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.c0D6EFD,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r)
                        )
                    ),
                    child:Text("Send inquiry",style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white,fontSize: 13.sp
                    ),))
              ],))
      ],),),
      SizedBox(height: 20.h,),
      Padding(
        padding:EdgeInsets.symmetric(horizontal: 16.w),
        child: Text("Recommended items",style: AppTextStyle.interSemiBold.copyWith(
            color: AppColors.c1C1C1C,fontSize: 18.sp
        ),),
      ),],);
  }
}
