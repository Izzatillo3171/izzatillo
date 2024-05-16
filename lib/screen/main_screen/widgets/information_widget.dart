import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> date = ["hour", "min", "sec"];
    return Column(
      children: [
        SizedBox(height: 15.h),
        SizedBox(
          width: double.infinity,
          height: 183.h,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Image.asset(AppImages.image1,width: double.infinity,height: 183.h,fit: BoxFit.cover,),
              ),
              Positioned(
                left: 26.w,
                top: 25.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Latest trending',
                      style: AppTextStyle.interRegular
                          .copyWith(color: AppColors.c1C1C1C, fontSize: 18.sp),
                    ),
                    Text(
                      'Electronic items',
                      style: AppTextStyle.interSemiBold.copyWith(
                        color: AppColors.c1C1C1C,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r))),
                        child: Text(
                          "Learn more",
                          style: AppTextStyle.interMedium.copyWith(
                              color: AppColors.c0D6EFD, fontSize: 13.sp),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Deals and offers',
                      style: AppTextStyle.interSemiBold
                          .copyWith(color: AppColors.c1C1C1C, fontSize: 18.sp)),
                  Text('Electronic equipments',
                      style: AppTextStyle.interRegular
                          .copyWith(color: AppColors.c1C1C1C, fontSize: 13.sp))
                ],
              ),
              const Spacer(),
              ...List.generate(date.length, (index) {
                return Container(
                  width: 55.w,
                  height: 55.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.cDEE2E7),
                  child: Column(
                    children: [
                      Text('13',
                          style: AppTextStyle.interSemiBold.copyWith(
                              color: AppColors.c8B96A5, fontSize: 13.sp)),
                      SizedBox(height:1.h,),
                      Text(
                        date[index],
                        style: AppTextStyle.interRegular.copyWith(
                            color: AppColors.c8B96A5, fontSize: 13.sp),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        SizedBox(height: 13.h),
      ],
    );
  }
}
