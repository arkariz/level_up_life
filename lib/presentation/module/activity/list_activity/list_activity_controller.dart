import 'package:get/get.dart';
import 'package:level_up_life/app/util/pocket.dart';
import 'package:level_up_life/data/services/database/objectbox/objectbox.dart';
import 'package:level_up_life/domain/module/activity/entity/activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_get_activity.dart';
import 'package:level_up_life/presentation/core/controller/base_controller.dart';
import 'package:level_up_life/domain/module/activity/repository/activity_repository.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/util/error_handler.dart';

class ListActivityController extends BaseController {
  ListActivityController({
    required this.activityRepository
  });

  final ActivityRepository activityRepository;

  @override
  void onInit() async {
    await getActivities();
    super.onInit();
  }

  final activities = List<Activity>.empty().obs;
  Future<void> getActivities() async {
    isLoading.value = true;
    final userId = await Pocket().getUserId();
    final request = RequestGetActivity(
      userId: userId,
    );

    final usecase = await activityRepository.getActivities(request);
    usecase.onFold(
      (result) async {
        activities.value = result;
      }
    );
    isLoading.value = false;
  }

  void navigateToCreateActivity() {
    Get.toNamed(AppRoutes.createActivity)?.then((value) async {
      await getActivities();
    });
  }

  Future<void> logout() async {
    isLoading.value = true;
    await Objectbox.deleteAllDbFiles();
    await Pocket().clear();
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.login);
  }
}