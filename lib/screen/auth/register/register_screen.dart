import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzatillo/data/local/local_storage.dart';
import 'package:izzatillo/screen/auth/register/widget/bottom_information.dart';
import 'package:izzatillo/screen/auth/register/widget/register_button.dart';
import 'package:izzatillo/screen/auth/register/widget/test_field_widget.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/images/app_images.dart';
import '../../../../utils/styles/app_text_style.dart';
import '../../../utils/constants/app_constants.dart';
import '../../main_screen/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  isValid() {
    return AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
        AppConstants.textRegExp.hasMatch(nameController.text) &&
        AppConstants.textRegExp.hasMatch(lastnameController.text) &&
        AppConstants.phoneRegExp.hasMatch(phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height:MediaQuery.of(context).size.height*0.12,
              ),
              Text(
                'Register',
                style: AppTextStyle.interSemiBold
                    .copyWith(color: AppColors.black, fontSize: 22.w),
              ),
              SizedBox(
                height: 26.h,
              ),
              TextFormFieldWidgets(
                regExp: AppConstants.textRegExp,
                textInputType: TextInputType.name,
                text: 'Username',
                controller: nameController,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldWidgets(
                regExp: AppConstants.textRegExp,
                textInputType: TextInputType.name,
                text: 'Lastname',
                controller: lastnameController,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldWidgets(
                regExp: AppConstants.phoneRegExp,
                textInputType: TextInputType.phone,
                text: "Phone",
                controller: phoneController,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldWidgets(
                regExp: AppConstants.passwordRegExp,
                textInputType: TextInputType.text,
                text: "Password",
                i: true,
                controller: passwordController,
              ),
              SizedBox(
                height: 35.h,
              ),
              RegisterButton(
                title: 'Register',
                onTap: () {
                  if(nameController.text.isNotEmpty && lastnameController.text.isNotEmpty && phoneController.text.isNotEmpty && passwordController.text.isNotEmpty){
                    StorageRepository.setString(key: 'name', value:nameController.text);
                    StorageRepository.setString(key: 'lastname', value:lastnameController.text);
                    StorageRepository.setString(key: 'phone', value:phoneController.text);
                    StorageRepository.setString(key: 'password', value:passwordController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const HomeScreen();
                    }));
                  }
                },
                isReady: isValid(),
              ),
              SizedBox(
                height: 13.h,
              ),
              const InformationWidgets()
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
