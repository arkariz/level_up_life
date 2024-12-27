import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/presentation/core/widgets/context_mixin/context_mixin.dart';
import 'package:level_up_life/presentation/module/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> with ContextMixin {
  SplashScreen({super.key});
  
  @override
  Widget buildScreen(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(26),
        child: Center(
          child: Icon(Icons.yard),
        )
      ),
    );
  }
}
