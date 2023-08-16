import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tech_blink/business_logics/controllers/auth_controller.dart';

import '../../../const/app_colors.dart';
import '../../responsive/size_config.dart';
import '../../route/route.dart';
import '../../widgtes/custom_button.dart';
import '../../widgtes/custom_text_field.dart';

class Registration extends StatelessWidget {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  RxBool _value = false.obs;
  final _formKEy = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: SizeConfig.screenHeight,
              child: Form(
                key: _formKEy,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      'assets/icons/logo.png',
                      width: 50.w,
                    ),
                    Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    customFormField(TextInputType.text, _userNameController,
                        context, 'Name', (val) {
                      if (val.isEmpty) {
                        return 'You must have write something';
                      }
                    }, prefixIcon: Icons.person_2_outlined),

                    customFormField(TextInputType.emailAddress,
                        _emailController, context, 'Email', (val) {
                      if (val.isEmpty) {
                        return 'You must have write something';
                      }
                      if (!val.contains(RegExp(r'\@'))) {
                        return 'Please write a valid email';
                      }
                    }, prefixIcon: Icons.email),

                    customFormField(TextInputType.text, _passwordController,
                        context, 'Password', (val) {
                      if (val.isEmpty) {
                        return 'You must have write something';
                      }
                    },
                        prefixIcon: Icons.remove_red_eye_outlined,
                        obscureText: true),

                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                              value: _value.value,
                              onChanged: (val) {
                                _value.value = val!;
                              }),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'I accept all thee ',
                              style: TextStyle(
                                  color: AppColors.grayColor, fontSize: 12)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(termsCondition),
                              text: ' Terms & Conditions',
                              style: TextStyle(
                                  color: AppColors.vampireBlackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                        ]))
                      ],
                    ),

                    //button==============================
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: 200,
                        height: 40,
                        child: customButton('Sign Up', () {
                          if (_formKEy.currentState!.validate() &&
                              _value.value == true) {
                            Get.find<AuthController>().signUp(_userNameController.text, _emailController.text.trim(), _passwordController.text.trim(), context);

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Please accept Terms and Condition'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        })),
//button==============================
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: Colors.black87,
                            thickness: 1,
                          )),
                          Text('  Or  '),
                          Expanded(
                              child: Divider(
                            color: Colors.black87,
                            thickness: 1,
                          )),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(50),
                          splashColor: AppColors.grayColor,
                          child: Ink(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.grayColor.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ]),
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child:
                                    Image.asset('assets/icons/facebook.png')),
                          ),
                        ),
                        SizedBox(
                          width: 27,
                        ),
                        InkWell(
                          onTap: ()=> AuthController().singnInWithGoogle(),
                          borderRadius: BorderRadius.circular(50),
                          splashColor: AppColors.grayColor,
                          child: Ink(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.grayColor.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ]),
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Image.asset('assets/icons/search.png')),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(color: AppColors.grayColor)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(login),
                          text: '  Log In',
                          style: TextStyle(
                              color: AppColors.vampireBlackColor,
                              fontWeight: FontWeight.w600)),
                    ]))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
