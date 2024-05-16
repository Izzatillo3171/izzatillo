import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izzatillo/screen/product/widget/grid_view_widget.dart';
import 'package:izzatillo/screen/product/widget/list_view_widget.dart';
import 'package:izzatillo/screen/product/widget/search_widget.dart';
import 'package:izzatillo/screen/product/widget/sort_widget.dart';
import '../../bloc/product_bloc/product_bloc.dart';
import '../../bloc/product_bloc/product_event.dart';
import '../../bloc/product_bloc/product_state.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
import '../basket/basket_screen.dart';
import '../main_screen/home_screen.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.text});
  final String text;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
class _ProductScreenState extends State<ProductScreen> {
  TextEditingController searchController = TextEditingController();
  String productText = 'All Products';
  int k = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<ProductBloc>().add(GetProductEvent(
                category: "All Categories",
                productName: "All Products",
                search: ''));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return  const HomeScreen();
            }));
          },
          icon: Icon(
            Icons.arrow_back,
            size: 25.sp,
          ),
        ),
        title: Text(
          widget.text,
          style: AppTextStyle.interSemiBold
              .copyWith(color: AppColors.c1C1C1C, fontSize: 18.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartScreen();
                }));
              },
              icon: SvgPicture.asset(
                AppImages.basket,
                width: 24.w,
                height: 24.h,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.person,
                width: 24.w,
                height: 24.h,
              )),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              SearchWidget(searchController: searchController, onChanged: (v) {
                context.read<ProductBloc>().add(GetProductEvent(
                    category: widget.text,
                    productName: productText,
                    search: v));
              },),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                  height: 36.h,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(state.productName.length, (index) {
                      String productName = state.productName[index];
                      return InkWell(
                        onTap: () {
                          productText = productName;
                          setState(() {});
                          context.read<ProductBloc>().add(GetProductEvent(
                              category: widget.text,
                              productName: productName,
                              search: ''));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: (productName == productText)
                                  ? AppColors.cDEE2E7
                                  : AppColors.cDEE2E7.withOpacity(0.4)),
                          child: Center(
                            child: Text(
                              productName,
                              style: AppTextStyle.interRegular.copyWith(
                                  color: AppColors.c0D6EFD, fontSize: 16.sp),
                            ),
                          ),
                        ),
                      );
                    }),
                  )),
              SizedBox(
                height: 18.h,
              ),
              SortWidget(onListView: (){
                k=0;
                setState(() {});
              }, onGridView: (){
                k=1;
                setState(() {});
              }),
              SizedBox(height: 20.h),
              Expanded(
                  child: (k == 0)
                      ? ListViewWidget(products: state.products)
                      : GridViewWidget(products: state.products))
            ],
          );
        },
      ),
    );
  }
}
