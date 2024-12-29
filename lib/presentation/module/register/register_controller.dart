import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:level_up_life/domain/module/user/repository/user_repository.dart';
import 'package:level_up_life/domain/module/user/request/request_create_user.dart';
import 'package:level_up_life/presentation/core/controller/base_controller.dart';
import 'package:level_up_life/presentation/core/generated/i18n/translations.g.dart';
import 'package:level_up_life/domain/module/auth/repository/auth_repository.dart';
import 'package:level_up_life/domain/module/auth/request/request_register.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/util/error_handler.dart';
import 'package:level_up_life/presentation/core/widgets/toast/custom_toast.dart';

class RegisterController extends BaseController {
  RegisterController({
    required this.authRepository,
    required this.userRepository,
  });

  final AuthRepository authRepository;
  final UserRepository userRepository;
  late Translations slang;

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> onTapRegister() async {
    if (!formKey.currentState!.validate()) return;
    if (passwordTextController.text != confirmPasswordTextController.text) {
      CustomToast.showError(slang.register.validation.confirmPassword.mustMatch);
      return;
    }
    isLoading.value = true;
    await register();
    isLoading.value = false;
  }

  Future<void> register() async {
    final requestRegister = RequestRegister(
      email: emailTextController.text,
      password: passwordTextController.text,
    );

    final usecase = await authRepository.registration(requestRegister);
    usecase.onFold(
      (result) async {
        await createUser(result);
        Get.offNamed(AppRoutes.login);
      }
    );
  }

  Future<void> createUser(User user) async {
    final request = RequestCreateUser(
      userId: user.uid,
      email: emailTextController.text,
      name: user.displayName ?? "",
      profilePicture: user.photoURL ?? "",
    );

    final usecase = await userRepository.createUser(request);
    usecase.onFold(
      (result) {
      }
    );
  }
}