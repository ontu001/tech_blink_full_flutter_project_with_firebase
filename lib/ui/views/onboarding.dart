import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:tech_blink/const/app_colors.dart';
import 'package:tech_blink/ui/route/route.dart';

import '../../model/intro.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroScreenOnboarding(
          backgroudColor: Colors.transparent,
          introductionList: introData
              .map((e) => Introduction(
                  imageUrl: e.image, title: e.title, subTitle: e.description))
              .toList(),
          foregroundColor: AppColors.mandarinColor,
          onTapSkipButton: ()=>Get.toNamed(login),
        ),
      ),
    );
  }
}
