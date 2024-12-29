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
    controller.slang = slang;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(26),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: slang.forgetPassword.email,
                label: slang.forgetPassword.emailPlaceholder,
                controller: controller.emailTextController,
                validation: {
                  ValidationMessage.required: ValidationData(message: slang.forgetPassword.validation.email.required),
                  ValidationMessage.email: ValidationData(message: slang.forgetPassword.validation.email.invalid),
                },
              ),
              ElevatedButton(
                onPressed: () {
                  controller.resetPassword();
                },
                child: Text(slang.forgetPassword.resetPassword),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
