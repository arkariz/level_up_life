import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:level_up_life/domain/module/auth/request/request_reset_password.dart';
import 'package:level_up_life/presentation/core/controller/base_controller.dart';
import 'package:level_up_life/domain/module/auth/repository/auth_repository.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/util/error_handler.dart';
import 'package:level_up_life/presentation/core/widgets/toast/custom_toast.dart';

class ForgetPasswordController extends BaseController {
  ForgetPasswordController({
    required this.authRepository
  });

  final AuthRepository authRepository;

  final emailTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void resetPassword() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    final requestForgetPassword = RequestResetPassword(
      email: emailTextController.text,
    );

    final usecase = await authRepository.sendPasswordResetEmail(requestForgetPassword);
    usecase.onFold(
      (result) async {
        await CustomToast.showSuccess(slang.forgetPassword.validation.success)?.delay();
        Get.offNamed(AppRoutes.login);
      }
    );
    isLoading.value = false;
  }
}