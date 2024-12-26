import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:level_up_life/presentation/module/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
      authRepository: GetIt.I(),
      userRepository: GetIt.I(),
    ));
  }
}