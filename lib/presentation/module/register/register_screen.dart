import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/presentation/core/widgets/mixin/base_mixin.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/custom_text_field.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/validation/validation_data.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/validation/validation_message.dart';
import 'package:level_up_life/presentation/module/register/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> with BaseMixin {
  RegisterScreen({super.key});
  
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(26),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: controller.slang.register.emailPlaceholder,
                label: controller.slang.register.email,
                controller: controller.emailTextController,
                validation: {
                  ValidationMessage.required: ValidationData(message: controller.slang.register.validation.email.required),
                  ValidationMessage.email: ValidationData(message: controller.slang.register.validation.email.invalid),
                },
              ),
              CustomTextField(
                hintText: controller.slang.register.passwordPlaceholder,
                label: controller.slang.register.password,
                controller: controller.passwordTextController,
                validation: {
                  ValidationMessage.required: ValidationData(message: controller.slang.register.validation.password.required),
                },
              ),
              CustomTextField(
                hintText: controller.slang.register.confirmPasswordPlaceholder,
                label: controller.slang.register.confirmPassword,
                controller: controller.confirmPasswordTextController,
                validation: {
                  ValidationMessage.required: ValidationData(message: controller.slang.register.validation.confirmPassword.required),
                },
              ),
              ElevatedButton(
                onPressed: () {
                  controller.onTapRegister();
                },
                child: Text(controller.slang.register.signUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
