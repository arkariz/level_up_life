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
    controller.slang = slang;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(26),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: slang.register.emailPlaceholder,
                label: slang.register.email,
                controller: controller.emailTextController,
                validation: {
                  ValidationMessage.required: ValidationData(message: slang.register.validation.email.required),
                  ValidationMessage.email: ValidationData(message: slang.register.validation.email.invalid),
                },
              ),
              CustomTextField(
                hintText: slang.register.passwordPlaceholder,
                label: slang.register.password,
                controller: controller.passwordTextController,
                validation: {
                  ValidationMessage.required: ValidationData(message: slang.register.validation.password.required),
                },
              ),
              CustomTextField(
                hintText: slang.register.confirmPasswordPlaceholder,
                label: slang.register.confirmPassword,
                controller: controller.confirmPasswordTextController,
                validation: {
                  ValidationMessage.required: ValidationData(message: slang.register.validation.confirmPassword.required),
                },
              ),
              ElevatedButton(
                onPressed: () {
                  controller.onTapRegister();
                },
                child: Text(slang.register.signUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
