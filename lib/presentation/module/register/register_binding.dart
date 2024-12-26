import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:level_up_life/presentation/module/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(
      authRepository: GetIt.I(),
      userRepository: GetIt.I(),
    ));
  }
}