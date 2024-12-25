import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:level_up_life/domain/module/auth/repository/auth_repository.dart';
import 'package:level_up_life/domain/module/auth/request/request_login.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/util/error_handler.dart';

class LoginController extends GetxController {
  LoginController({
    required this.authRepository
  });

  final AuthRepository authRepository;

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void login() async {
    final requestLogin = RequestLogin(
      email: emailTextController.text,
      password: passwordTextController.text,
    );

    final usecase = await authRepository.login(requestLogin);
    usecase.onFold(
      (result) {
        Get.offAllNamed(AppRoutes.example);
      }
    );
  }
}