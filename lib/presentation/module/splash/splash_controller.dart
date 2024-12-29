import 'package:get/get.dart';
import 'package:level_up_life/app/util/pocket.dart';
import 'package:level_up_life/domain/module/activity/repository/activity_repository.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/util/error_handler.dart';

class SplashController extends GetxController {
  SplashController({
    required this.pocket,
    required this.activityRepository
  });

  final Pocket pocket;
  final ActivityRepository activityRepository;

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    final isLoggedIn = await pocket.getIsLoggedIn();

    if (isLoggedIn) {
      final usecase = await activityRepository.syncActivitiesOnLaunch();
      usecase.onFold(
        (result) async {
          Get.offAllNamed(AppRoutes.listActivity);
        }
      );
    } else {
      Get.offAllNamed(AppRoutes.login);
    }

    super.onInit();
  }
}