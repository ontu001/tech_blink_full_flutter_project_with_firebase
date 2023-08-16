import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_blink/const/app_colors.dart';
import 'package:tech_blink/ui/route/route.dart';
import 'package:tech_blink/ui/widgtes/custom_button.dart';
import 'package:tech_blink/ui/widgtes/custom_text_field.dart';
import '../../../business_logics/controllers/auth_controller.dart';
import '../../responsive/size_config.dart';

class Login extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                      height: 30,
                    ),
                    Image.asset(
                      'assets/icons/logo.png',
                      width: 50.w,
                    ),
                    Text(
                      'Log In',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 40,
                    ),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Get.toNamed(forgetpassword),
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: 200,
                        height: 40,
                        child: customButton('Log In', () {
                          if (_formKEy.currentState!.validate()) {
                            Get.find<AuthController>().login(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                context);
                          } else {
                            print('Failed');
                          }
                        })),
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
                          text: 'Don\'t have an account?',
                          style: TextStyle(color: AppColors.grayColor)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(registration),
                          text: ' Sign up',
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
