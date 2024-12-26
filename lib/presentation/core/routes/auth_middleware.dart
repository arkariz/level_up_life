import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:level_up_life/data/services/firebase/auth/firebase_auth_sevice.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (FirebaseAuthService().getUser() == null) {
      return const RouteSettings(name: AppRoutes.login);
    }

    return super.redirect(route);
  }
}