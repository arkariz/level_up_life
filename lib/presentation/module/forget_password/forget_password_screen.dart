import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/presentation/core/widgets/mixin/base_mixin.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/custom_text_field.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/validation/validation_data.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/validation/validation_message.dart';
import 'package:level_up_life/presentation/module/forget_password/forget_password_controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> with BaseMixin {
  ForgetPasswordScreen({super.key});
  
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
                hintText: controller.slang.forgetPassword.email,
                label: controller.slang.forgetPassword.emailPlaceholder,
                controller: controller.emailTextController,
                validation: {
                  ValidationMessage.required: ValidationData(message: controller.slang.forgetPassword.validation.email.required),
                  ValidationMessage.email: ValidationData(message: controller.slang.forgetPassword.validation.email.invalid),
                },
              ),
              ElevatedButton(
                onPressed: () {
                  controller.resetPassword();
                },
                child: Text(controller.slang.forgetPassword.resetPassword),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
