import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class SearchWidgets extends StatelessWidget {
  const SearchWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: AppTextStyle.interRegular
                .copyWith(color: AppColors.c8B96A5, fontSize: 16.sp),
            contentPadding:
            EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
            prefixIcon: TextButton(
              onPressed: (){},
              child: Icon(Icons.search,
                  color: AppColors.c8B96A5, size: 22.w),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(
                    width: 1.sp, color: AppColors.cDEE2E7)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(
                    width: 1.sp, color: AppColors.cDEE2E7)),
          )),
    );
  }
}
