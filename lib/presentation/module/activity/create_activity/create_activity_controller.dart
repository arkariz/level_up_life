import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/app/util/pocket.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';
import 'package:level_up_life/domain/module/activity/request/request_create_activity.dart';
import 'package:level_up_life/presentation/core/controller/base_controller.dart';
import 'package:level_up_life/domain/module/activity/repository/activity_repository.dart';
import 'package:level_up_life/presentation/core/util/error_handler.dart';
import 'package:level_up_life/presentation/core/widgets/toast/custom_toast.dart';

class CreateActivityController extends BaseController {
  CreateActivityController({
    required this.activityRepository
  });

  final ActivityRepository activityRepository;

  final titleTextController = TextEditingController();

  Future<void> createActivity() async {
    isLoading.value = true;

    final request = RequestCreateActivity(
      userId: await Pocket().getUserId(),
      title: titleTextController.text,
      description: "descriptionTextController.text",
      startDate: DateTime.now(),
      color: Colors.white,
      frequency: ActivityFrequency.daily,
    );

    final usecase = await activityRepository.createActivity(request);
    usecase.onFold(
      (result) async {
        await CustomToast.showSuccess("success")?.delay();
        Get.back();
      }
    );
    isLoading.value = false;
  }
}