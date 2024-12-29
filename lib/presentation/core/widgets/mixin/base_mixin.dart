import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:level_up_life/presentation/core/controller/base_controller.dart';
import 'package:level_up_life/presentation/core/generated/i18n/translations.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum LoadingStyle {skeleton, spinner}

mixin BaseMixin<T extends BaseController> on GetView<T> {
  @protected
  Widget buildScreen(BuildContext context);
  
  @protected
  LoadingStyle loadingStyle = LoadingStyle.spinner;

  @override
  Widget build(BuildContext context) {
    controller.slang = Translations.of(context);
    switch (loadingStyle) {
      case LoadingStyle.skeleton:
        return Obx(() => Skeletonizer(
          enabled: controller.isLoading.value,
          child: buildScreen(context),
        ));
      case LoadingStyle.spinner:
        return Obx(() => Stack(
          children: [
            buildScreen(context),
            Visibility(
              visible: controller.isLoading.value,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withValues(alpha: 0.4),
                  child: const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
      }
  }
}