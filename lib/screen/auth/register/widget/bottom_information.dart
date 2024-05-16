import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/images/app_images.dart';
import '../../../../utils/styles/app_text_style.dart';

class InformationWidgets extends StatefulWidget {
  const InformationWidgets({super.key});

  @override
  State<InformationWidgets> createState() => _InformationWidgetsState();
}

class _InformationWidgetsState extends State<InformationWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('OR'),
      TextButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: RichText(text:TextSpan(
            text:'Already have an account? ',
            style: AppTextStyle.interRegular.copyWith(
                color: AppColors.black,fontSize: 11.w
            ),
            children: [
              TextSpan(
                text: ' Log in now',
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
