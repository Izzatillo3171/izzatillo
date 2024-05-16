import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izzatillo/screen/main_screen/widgets/categories_widget.dart';
import 'package:izzatillo/screen/main_screen/widgets/category_widget.dart';
import 'package:izzatillo/screen/main_screen/widgets/drawer_widget.dart';
import 'package:izzatillo/screen/main_screen/widgets/information_widget.dart';
import 'package:izzatillo/screen/main_screen/widgets/reccomen_info_widget.dart';
import 'package:izzatillo/screen/main_screen/widgets/recommen_widget.dart';
import 'package:izzatillo/screen/main_screen/widgets/search_widget.dart';
import 'package:izzatillo/screen/profile/profile_screen.dart';
import '../../bloc/product_bloc/product_bloc.dart';
import '../../bloc/product_bloc/product_event.dart';
import '../../bloc/product_bloc/product_state.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
import '../basket/basket_screen.dart';
import '../product/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> cate = [
    'All Categories',
    "Gadgets",
    "Clothes",
    "Accessory",
    "Furniture"
  ];
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductEvent(
        category: cate[0], productName: 'All Products', search: ""));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: Row(
            children: [
              SvgPicture.asset((AppImages.lock), width: 34.w, height: 34.h),
              SizedBox(width: 8.w),
              Text('Brand',
                  style: AppTextStyle.interBold
                      .copyWith(color: AppColors.c_8CB7F5, fontSize: 22.sp)),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CartScreen();
                    }));
                  },
                  icon: SvgPicture.asset(AppImages.basket,
                      width: 24.w, height: 24.h)),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return ProfileScreen();
                    }));
                  },
                  icon: SvgPicture.asset(AppImages.person,
                      width: 24.w, height: 24.h)),
            ],
          ),
        ),
        // backgroundColor: AppColors.white,
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.products.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h),
                  const SearchWidgets(),
                  SizedBox(height: 16.h),
                  SizedBox(
                      height: 36.h,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        scrollDirection: Axis.horizontal,
                        children: List.generate(cate.length, (index) {
                          String category = cate[index];
                          return InkWell(
                            onTap: () {
                              context.read<ProductBloc>().add(GetProductEvent(
                                  category: category,
                                  productName: "All Products",
                                  search: ''));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductScreen(text: category);
                              }));
                            },
                            borderRadius: BorderRadius.circular(8.r),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.cDEE2E7.withOpacity(0.5)),
                              child: Center(
                                child: Text(
                                  category,
                                  style: AppTextStyle.interRegular.copyWith(
                                      color: AppColors.c0D6EFD,
                                      fontSize: 16.sp),
                                ),
                              ),
                            ),
                          );
                        }),
                      )),
                  const InformationWidget(),
                  DiscountWidget(products:state.products),
                  SizedBox(
                    height: 10.h,
                  ),
                  CategoriesWidget(products:state.products,),
                  SizedBox(height: 10.h),
                  const RecommendedInfoWidget(),
                  SizedBox(height: 10.h),
                  SizedBox(height: 30.h),
                ],
              ),
            );
          },
        ));
  }
}
