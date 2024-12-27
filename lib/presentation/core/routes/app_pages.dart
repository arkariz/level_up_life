import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/module/activity/create_activity/create_activity_binding.dart';
import 'package:level_up_life/presentation/module/activity/create_activity/create_activity_screen.dart';
import 'package:level_up_life/presentation/module/activity/list_activity/list_activity_binding.dart';
import 'package:level_up_life/presentation/module/activity/list_activity/list_activity_screen.dart';
import 'package:level_up_life/presentation/module/forget_password/forget_password_binding.dart';
import 'package:level_up_life/presentation/module/forget_password/forget_password_screen.dart';
import 'package:level_up_life/presentation/module/login/login_binding.dart';
import 'package:level_up_life/presentation/module/login/login_screen.dart';
import 'package:level_up_life/presentation/module/register/register_binding.dart';
import 'package:level_up_life/presentation/module/register/register_screen.dart';
import 'package:level_up_life/presentation/module/splash/splash_binding.dart';
import 'package:level_up_life/presentation/module/splash/splash_screen.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.listActivity,
      page: () => ListActivityScreen(),
      binding: ListActivityBinding(),
    ),
    GetPage(
      name: AppRoutes.createActivity,
      page: () => CreateActivityScreen(),
      binding: CreateActivityBinding(),
    ),
  ];
}
