import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/routes/auth_middleware.dart';
import 'package:level_up_life/presentation/module/example/example_binding.dart';
import 'package:level_up_life/presentation/module/example/example_screen.dart';
import 'package:level_up_life/presentation/module/forget_password/forget_password_binding.dart';
import 'package:level_up_life/presentation/module/forget_password/forget_password_screen.dart';
import 'package:level_up_life/presentation/module/login/login_binding.dart';
import 'package:level_up_life/presentation/module/login/login_screen.dart';
import 'package:level_up_life/presentation/module/register/register_binding.dart';
import 'package:level_up_life/presentation/module/register/register_screen.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: AppRoutes.example,
      page: () => ExampleScreen(),
      binding: ExampleBinding(),
      middlewares: [
        AuthMiddleware(),
      ]
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
  ];
}
