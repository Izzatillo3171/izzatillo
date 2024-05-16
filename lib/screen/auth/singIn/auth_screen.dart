import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzatillo/data/local/local_storage.dart';
import 'package:izzatillo/screen/auth/singIn/widget/bottom_information.dart';
import 'package:izzatillo/screen/auth/singIn/widget/login_button.dart';
import 'package:izzatillo/screen/auth/singIn/widget/test_field_widget.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/images/app_images.dart';
import '../../../../utils/styles/app_text_style.dart';
import '../../../utils/constants/app_constants.dart';
import '../../main_screen/home_screen.dart';
import '../register/widget/bottom_information.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool k = false;

  @override
  void initState() {
    _init();
    super.initState();
  }
  Future<void> _init() async {
    User? user = FirebaseAuth.instance.currentUser;
    Future.microtask(() {
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      }
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  isValid() {
    return AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
        AppConstants.textRegExp.hasMatch(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height:MediaQuery.of(context).size.height*0.25,
              ),
              Text(
                'LOGIN',
                style: AppTextStyle.interSemiBold
                    .copyWith(color: AppColors.black, fontSize: 22.w),
              ),
              SizedBox(
                height: 26.h,
              ),
              TextFormFieldWidget(
                regExp: AppConstants.textRegExp,
                icon: AppImages.person,
                text: 'Username',
                controller: emailController,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldWidget(
                regExp: AppConstants.passwordRegExp,
                icon: AppImages.image1,
                text: "Password",
                i: true,
                controller: passwordController,
              ),
              SizedBox(
                height: 35.h,
              ),
              LogInButton(
                title: 'LOGIN',
                onTap: () {
                  if(StorageRepository.getString(key: 'name')==emailController
                      .text&& StorageRepository.getString(key: 'password')==passwordController.text){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                      return HomeScreen();
                    }));
                  }
                  else{
                    debugPrint(StorageRepository.getString(key: 'name'));
                    debugPrint(StorageRepository.getString(key: 'password'));
                    debugPrint(emailController.text);
                    debugPrint(passwordController.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("User is not found")));
                  }
                },
                isReady: isValid(),
              ),
              SizedBox(
                height: 13.h,
              ),
              const InformationWidgetSignIn()
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
