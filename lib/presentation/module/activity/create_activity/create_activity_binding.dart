import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:level_up_life/presentation/module/activity/create_activity/create_activity_controller.dart';

class CreateActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateActivityController>(() => CreateActivityController(
      activityRepository: GetIt.I(),
    ));
  }
}