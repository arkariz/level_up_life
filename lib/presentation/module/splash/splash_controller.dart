import 'package:get/get.dart';
import 'package:level_up_life/app/util/pocket.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';

class SplashController extends GetxController {
  SplashController({required this.pocket});

  final Pocket pocket;

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    final isLoggedIn = await pocket.getIsLoggedIn();

    if (isLoggedIn) {
      Get.offAllNamed(AppRoutes.listActivity);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }

    super.onInit();
  }
}