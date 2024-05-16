import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../product/product_screen.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFEFF2F4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_circle_sharp,color: AppColors.c8B96A5,size: 46.sp,),
                SizedBox(height: 10.h),
                Text(
                  "Sign in | Register",
                  style: TextStyle(
                    color: AppColors.c1C1C1C,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined,weight: 20.w,color: AppColors.c8B96A5),
            title: Text("Home",style: AppTextStyle.interMedium.copyWith(color: AppColors.c8B96A5)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:const Icon(Icons.menu_outlined,color: AppColors.c8B96A5,),
            title: Text("Category",style: AppTextStyle.interMedium.copyWith(color:AppColors.c8B96A5)),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return const ProductScreen(text:'All Categories');
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_border,weight: 20.w,color:AppColors.c8B96A5),
            title: Text("Favourite",style: AppTextStyle.interMedium.copyWith(color:AppColors.c8B96A5)),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined,color: AppColors.c8B96A5,),
            title: Text("My Orders",style: AppTextStyle.interMedium.copyWith(color:AppColors.c8B96A5)),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language,color:AppColors.c8B96A5,weight: 20.w),
            title: Text("English | USD",style: AppTextStyle.interMedium.copyWith(color:AppColors.c8B96A5)),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail,weight: 20.w,color: AppColors.c8B96A5),
            title: Text("Contact us",style: AppTextStyle.interMedium.copyWith(color:AppColors.c8B96A5)),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.info,weight: 20.w,color:AppColors.c8B96A5),
            title: Text("About",style: AppTextStyle.interMedium.copyWith(color:AppColors.c8B96A5)),
            onTap: () {
            },
          ),
          const Divider(),
          ListTile(
            leading: const SizedBox(),
            title: Text("User agreement",style: AppTextStyle.interMedium.copyWith(color: Colors.black87)),
            onTap: () {
            },
          ),
          ListTile(
            leading: const SizedBox(),
            title: Text("Partnership",style: AppTextStyle.interMedium.copyWith(color: Colors.black87)),
            onTap: () {
            },
          ),
          ListTile(
            leading: const SizedBox(),
            title: Text("Privacy policy",style: AppTextStyle.interMedium.copyWith(color: Colors.black87)),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
