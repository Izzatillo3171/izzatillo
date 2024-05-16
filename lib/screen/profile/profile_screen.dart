import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzatillo/data/local/local_storage.dart';
import 'package:izzatillo/utils/styles/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../utils/colors/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Padding(
        padding:EdgeInsets.all(33.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle_sharp,size: 100.sp,),
              Text("${StorageRepository.getString(key: 'name')} ${StorageRepository.getString(key: 'lastname')}",style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize: 34.sp,
              ),),
              SizedBox(height: 4.h,),
              InkWell(
                onTap: (){
                  final call=Uri.parse('tel: ${StorageRepository.getString(key: 'phone')}');
                  launchUrl(call);
                },
                child: Row(children: [
                  Icon(Icons.phone,size: 34.sp,),
                  SizedBox(width: 4.w,),
                  Text(StorageRepository.getString(key: "phone",),style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.black,fontSize:24.sp
                  ),)
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
