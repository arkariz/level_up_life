import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:level_up_life/app/util/pocket.dart';
import 'package:level_up_life/domain/module/auth/repository/auth_repository.dart';
import 'package:level_up_life/domain/module/auth/request/request_login.dart';
import 'package:level_up_life/domain/module/user/repository/user_repository.dart';
import 'package:level_up_life/domain/module/user/request/request_get_user.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/util/error_handler.dart';

class LoginController extends GetxController {
  LoginController({
    required this.authRepository,
    required this.userRepository,
  });

  final AuthRepository authRepository;
  final UserRepository userRepository;

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void login() async {
    final requestLogin = RequestLogin(
      email: emailTextController.text,
      password: passwordTextController.text,
    );

    final usecase = await authRepository.login(requestLogin);
    usecase.onFold(
      (result) async {
        await getUser(result);
      }
    );
  }

  Future<void> getUser(User user) async {
    final request = RequestGetUser(
      userId: user.uid,
      email: user.email ?? "",
      name: user.displayName ?? "",
      profilePicture: user.photoURL ?? "",
    );
    final usecase = await userRepository.getUser(request);
    usecase.onFold(
      (result) {
        final pocket = Pocket();
        pocket.setUserId(result.userId);
        pocket.setIsLoggedIn(true);
        Get.toNamed(AppRoutes.listActivity);
      }
    );
  }
}