import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class SortWidget extends StatelessWidget {
  const SortWidget(
      {super.key, required this.onListView, required this.onGridView});

  final VoidCallback onListView;
  final VoidCallback onGridView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: AppColors.c8B96A5),
          color: AppColors.white),
      child: Row(
        children: [
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(width: 1.sp, color: AppColors.c8B96A5))),
              child: Row(
                children: [
                  Text(
                    "Sort: Newest",
                    style: AppTextStyle.interMedium
                        .copyWith(color: AppColors.black, fontSize: 13.sp),
                  ),
                  SizedBox(width: 5.w),
                  const Icon(Icons.sort, color: AppColors.c8B96A5)
                ],
              )),
          SizedBox(width: 5.w),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(width: 1.sp, color: AppColors.c8B96A5))),
              child: Row(
                children: [
                  Text(
                    "Filter (3)",
                    style: AppTextStyle.interMedium
                        .copyWith(color: AppColors.black, fontSize: 13.sp),
                  ),
                  SizedBox(width: 5.w),
                  const Icon(
                    Icons.filter_alt,
                    color: AppColors.c8B96A5,
                  )
                ],
              )),
          const Spacer(),
          SizedBox(
            width: 35.h,
            height: 35.h,
            child: TextButton(
                onPressed: onGridView,
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(1.sp),
                    side: BorderSide(width: 1.sp, color: AppColors.c8B96A5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
                      ),
                    )),
                child: Icon(Icons.grid_view,
                    color: AppColors.c1C1C1C, size: 20.sp)),
          ),
          SizedBox(
            width: 35.w,
            height: 35.h,
            child: TextButton(
                onPressed: onListView,
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(1.sp),
                    side: BorderSide(width: 1.sp, color: AppColors.c8B96A5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                    )),
                child: Icon(Icons.view_list,
                    color: AppColors.c1C1C1C, size: 20.sp)),
          ),
        ],
      ),
    );
  }
}
