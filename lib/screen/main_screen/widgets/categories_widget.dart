import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../bloc/product_bloc/product_bloc.dart';
import '../../../bloc/product_bloc/product_event.dart';
import '../../../data/models/product_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../about_product/about_produt_screen.dart';
import '../../product/product_screen.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final List<String> cate = [
      'All Categories',
      "Gadgets",
      "Clothes",
      "Accessory",
      "Furniture"
    ];
    return Column(children: [
      ...List.generate(4, (index) {
        List<ProductModel> pro = products
            .where((e) => e.category == cate[index + 1])
            .toList();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 14.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  cate[index + 1],
                  style: AppTextStyle.interSemiBold.copyWith(
                      color: AppColors.c1C1C1C, fontSize: 18.sp),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              SizedBox(
                height: 180.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(pro.length, (index) {
                    String img = pro[index].imageUrl;
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return AboutProductScreen(
                                  productModel: pro[index]);
                            }));
                      },
                      child: Container(
                        width: 140.w,
                        height: 180.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.sp,
                                color: AppColors.cDEE2E7)),
                        padding:
                        EdgeInsets.symmetric(horizontal: 11.w),
                        child: Column(
                          children: [
                            Image.network(
                              img,
                              width: 98.w,
                              height: 98.h,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              pro[index].productName,
                              style: AppTextStyle.interRegular
                                  .copyWith(
                                  color: AppColors.black,
                                  fontSize: 13.sp),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              pro[index].category,
                              style: AppTextStyle.interRegular
                                  .copyWith(
                                  color: AppColors.c8B96A5,
                                  fontSize: 13.sp),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              ListTile(
                onTap: () {
                  context.read<ProductBloc>().add(GetProductEvent(
                      category: pro[index].category,
                      productName: "All Products",
                      search: ''));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return ProductScreen(
                          text: pro[index].category,
                        );
                      }));
                },
                title: Text(
                    "Source now -->",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.c0D6EFD, fontSize: 16.sp)
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 1.h,
                  color: AppColors.c8B96A5)
            ],
          ),
        );
      }),
    ],);
  }
}
