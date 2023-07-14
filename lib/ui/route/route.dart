import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import '../views/not_found.dart';
import '../views/splash.dart';

const String splash = '/splash-screen';
const String unknown = '/not-found';


List<GetPage> getPages = [
GetPage(
name: unknown,
page: () => Unknown(),
),
GetPage(
name: splash,
page: () => Splash(),

),
];