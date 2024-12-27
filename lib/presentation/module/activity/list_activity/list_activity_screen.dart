import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/app/util/pocket.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/widgets/context_mixin/context_mixin.dart';
import 'package:level_up_life/presentation/module/activity/list_activity/list_activity_controller.dart';

class ListActivityScreen extends GetView<ListActivityController> with ContextMixin {
  ListActivityScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    controller.slang = slang;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        children: [
          const SizedBox(height: 500),
          FloatingActionButton(
            child: const Icon(Icons.add, color: Colors.black),
            heroTag: "createActivity",
            onPressed: () {
              controller.navigateToCreateActivity();
            },
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            child: const Icon(Icons.logout, color: Colors.black),
            heroTag: "logout",
            onPressed: () {
              Pocket().clear();
              Get.offAllNamed(AppRoutes.login);
            },
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(26),
        child: Obx(() => ListView.builder(
        itemCount: controller.activities.length,
        itemBuilder: (context, index) {
          final activity = controller.activities[index];
          return ListTile(
            title: Text(activity.title),
            subtitle: Text(activity.description),
            trailing: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          );
        },
      ))),
    );
  }
}
