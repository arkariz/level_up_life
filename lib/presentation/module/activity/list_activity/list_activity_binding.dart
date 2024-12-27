import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:level_up_life/presentation/module/activity/list_activity/list_activity_controller.dart';

class ListActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListActivityController>(() => ListActivityController(
      activityRepository: GetIt.I(),
    ));
  }
}