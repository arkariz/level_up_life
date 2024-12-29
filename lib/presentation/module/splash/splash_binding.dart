import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:level_up_life/app/util/pocket.dart';
import 'package:level_up_life/presentation/module/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(
      pocket: Pocket(),
      activityRepository: GetIt.I(),
    )); 
  }
}