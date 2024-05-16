import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzatillo/screen/auth/register/register_screen.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/images/app_images.dart';
import '../../../../utils/styles/app_text_style.dart';

class InformationWidgetSignIn extends StatefulWidget {
  const InformationWidgetSignIn({super.key});

  @override
  State<InformationWidgetSignIn> createState() => _InformationWidgetSignInState();
}

class _InformationWidgetSignInState extends State<InformationWidgetSignIn> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('OR'),
      SizedBox(height: 19.h,),
      TextButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return const RegisterScreen();
          }));
        },
        child: RichText(text:TextSpan(
            text:'Don’t have an account? ',
            style: AppTextStyle.interRegular.copyWith(
                color: AppColors.black,fontSize: 11.w
            ),
            children: [
              TextSpan(
                text: ' Register now',
                style: AppTextStyle.interRegular.copyWith(
                    color: Colors.blue,fontSize: 11.w
                ),
              )
            ]
        )),
      )
    ],);
  }
}
