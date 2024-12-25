import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/presentation/core/generated/i18n/translations.g.dart';
import 'package:level_up_life/presentation/core/widgets/context_mixin/context_mixin.dart';
import 'package:level_up_life/presentation/module/example/example_controller.dart';

class ExampleScreen extends GetView<ExampleController> with ContextMixin {
  ExampleScreen({super.key});
  
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(slang.example.hello),
          const SizedBox(height: 20),
          Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.books.length,
            itemBuilder: (context, index) {
              return Text(controller.books[index].title);
            },
          )),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              LocaleSettings.setLocale(AppLocale.id);
            },
            child: const Text('Change Locale to Indonesia'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              LocaleSettings.setLocale(AppLocale.en);
            },
            child: const Text('Change Locale to English'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              controller.logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
