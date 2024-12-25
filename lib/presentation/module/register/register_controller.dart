import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:level_up_life/presentation/core/generated/i18n/translations.g.dart';
import 'package:level_up_life/domain/module/auth/repository/auth_repository.dart';
import 'package:level_up_life/domain/module/auth/request/request_register.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/util/error_handler.dart';
import 'package:level_up_life/presentation/core/widgets/toast/custom_toast.dart';

class RegisterController extends GetxController {
  RegisterController({
    required this.authRepository
  });

  final AuthRepository authRepository;
  late Translations slang;

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register() async {
    if (!formKey.currentState!.validate()) return;
    if (passwordTextController.text != confirmPasswordTextController.text) {
      CustomToast.showError(slang.register.validation.confirmPassword.mustMatch);
      return;
    }

    final requestRegister = RequestRegister(
      email: emailTextController.text,
      password: passwordTextController.text,
    );

    final usecase = await authRepository.registration(requestRegister);
    usecase.onFold(
      (result) async {
        Get.offNamed(AppRoutes.login);
      }
    );
  }
}