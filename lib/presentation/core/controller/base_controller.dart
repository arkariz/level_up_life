import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:level_up_life/presentation/core/generated/i18n/translations.g.dart';

class BaseController extends GetxController {
  final isLoading = false.obs;
  late Translations slang;
}