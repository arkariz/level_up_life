import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:level_up_life/presentation/module/forget_password/forget_password_controller.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController(
      authRepository: GetIt.I(),
    ));
  }
}