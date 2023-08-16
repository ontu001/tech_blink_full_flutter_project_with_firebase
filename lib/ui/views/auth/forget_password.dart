import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../business_logics/controllers/auth_controller.dart';
import '../../../const/app_colors.dart';
import '../../responsive/size_config.dart';
import '../../route/route.dart';
import '../../widgtes/custom_button.dart';
import '../../widgtes/custom_text_field.dart';

class ForgetPassword extends StatelessWidget{
  TextEditingController _emailController = TextEditingController();
  final _formKEy =GlobalKey<FormState>();
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
                    SizedBox(height: 60,),
                    Image.asset(
                      'assets/icons/logo.png',
                      width: 80.w,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Forget Your Password',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 40,),
                    customFormField(TextInputType.emailAddress, _emailController,
                        context, 'Email', (val) {
                          if(val.isEmpty){
                            return 'You must have write something';
                          }
                          if(!val.contains(RegExp(r'\@'))){
                            return 'Please write a valid email';
                          }
                        },
                        prefixIcon: Icons.email),


                    SizedBox(height: 30,),
                    SizedBox(width: 180,height:35,child: customButton('Confirm', (){

                      if(_formKEy.currentState!.validate()){
                        Get.find<AuthController>().forgetPassword(
                            _emailController.text.trim(),
                            context);
                      }
                      else{
                        print('Failed');
                      }
                    })),

                    SizedBox(height: 30,),

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

class _passwordController {
}