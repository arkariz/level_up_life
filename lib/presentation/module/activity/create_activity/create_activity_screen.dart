import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/presentation/core/widgets/mixin/base_mixin.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/custom_text_field.dart';
import 'package:level_up_life/presentation/module/activity/create_activity/create_activity_controller.dart';

class CreateActivityScreen extends GetView<CreateActivityController> with BaseMixin {
  CreateActivityScreen({super.key});
  
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(26),
        child: Column(
          spacing: 16,
          children: [
            CustomTextField(
              label: "Title",
              controller: controller.titleTextController,
            ),
            ElevatedButton(
              onPressed: () {
                controller.createActivity();
              },
              child: Text("Create Activity"),
            ),
          ],
        )
      ),
    );
  }
}
