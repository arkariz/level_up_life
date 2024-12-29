import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/widgets/mixin/base_mixin.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/custom_text_field.dart';
import 'package:level_up_life/presentation/module/login/login_controller.dart';

class LoginScreen extends GetView<LoginController> with BaseMixin {
  LoginScreen({super.key});
  
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(26),
        child: Column(
          children: [
            CustomTextField(
              hintText: slang.example.hello,
              label: slang.example.hello,
              controller: controller.emailTextController,
            ),
            CustomTextField(
              hintText: slang.example.hello,
              label: slang.example.hello,
              controller: controller.passwordTextController,
            ),
            ElevatedButton(
              onPressed: () {
                controller.login();
              },
              child: Text(slang.example.hello),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.register);
              },
              child: Text(slang.register.signUp),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.forgetPassword);
              },
              child: Text(slang.forgetPassword.forgetPassword),
            ),
          ],
        ),
      ),
    );
  }
}
