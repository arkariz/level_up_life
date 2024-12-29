import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/presentation/module/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
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
