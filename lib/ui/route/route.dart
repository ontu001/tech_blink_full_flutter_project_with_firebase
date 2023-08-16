import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:tech_blink/business_logics/bindings/auth_binding.dart';
import 'package:tech_blink/business_logics/bindings/splash_binding.dart';
import 'package:tech_blink/ui/views/auth/login.dart';
import 'package:tech_blink/ui/views/auth/registration.dart';
import 'package:tech_blink/ui/views/auth/terms_conditions.dart';
import 'package:tech_blink/ui/views/bottom_nav_controller.dart';
import 'package:tech_blink/ui/views/nav_pages/favourite.dart';
import 'package:tech_blink/ui/views/nav_pages/home.dart';
import 'package:tech_blink/ui/views/nav_pages/profile.dart';
import 'package:tech_blink/ui/views/onboarding.dart';
import '../views/auth/forget_password.dart';
import '../views/nav_pages/cart.dart';
import '../views/not_found.dart';
import '../views/splash.dart';





const String splash = '/splash-screen';
const String unknown = '/not-found';
const String intro = '/intro';
const String login = '/login';
const String registration = '/registration';
const String forgetpassword = '/forgetpassword';
const String termsCondition = '/termsCondition';
const String bottomNav = '/bottomNav';
const String home = '/home';
const String favourite = '/favourite';
const String cart = '/cart';
const String profile = '/profile';

List<GetPage> getPages = [
GetPage(
name: unknown,
page: () => Unknown(),
),
GetPage(
name: splash,
page: () => Splash(),
  binding: SplashBinding(),

),
  GetPage(
    name: intro,
    page: () => Onboarding(),

  ),

  GetPage(
    name: login,
    page: () => Login(),
    binding: AuthBinding()

  ),
  GetPage(
    name: registration,
    page: () => Registration(),
    binding: AuthBinding()

  ),


  GetPage(
    name: forgetpassword,
    page: () => ForgetPassword(),
    binding: AuthBinding()

  ),


  GetPage(
    name: termsCondition,
    page: () => TermsAndCondition(),

  ),

  GetPage(
    name: bottomNav,
    page: () => BottomNavController(),

  ),
  GetPage(
    name: home,
    page: () => Home(),

  ),

  GetPage(
    name: favourite,
    page: () => Favourite(),

  ),
  GetPage(
    name: cart,
    page: () => Cart(),

  ),
  GetPage(
    name: profile,
    page: () => Profile(),

  ),


];