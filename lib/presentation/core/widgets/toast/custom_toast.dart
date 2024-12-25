import 'package:flutter/widgets.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  static void showError(String message) {
    toastification.show(
      description: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored
    );
  }
}