import 'package:get/get.dart';
import 'package:tele_health/screens/core/core_export.dart';

class RouteHelper {
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String splash = '/splash';
  static const String initial = '/';

  static String getSignInRoute(String page) => '$signIn?page=$page';
  static String getInitialRoute() => '$initial';

  static List<GetPage> routes = [
    //GetPage(name: initial, page: () => BottomNavigation(pageIndex: 0)),
    GetPage(name: signIn, page: () => Login(exitFromApp: Get.parameters['page'] == signUp || Get.parameters['page'] == splash,)),
  ];
}
