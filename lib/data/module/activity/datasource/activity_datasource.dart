import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/domain/module/activity/request/request_create_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_get_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_update_activity.dart';

abstract class ActivityDatasource {
  Future<bool> createActivity(RequestCreateActivity activity, {bool isTemporary = false});
  Future<bool> createManyActivities(List<RequestCreateActivity> request, {bool isTemporary = false});
  Future<List<ActivityModel>> getActivities({RequestGetActivity? request, bool isTemporary = false});
  Future<ActivityModel> getActivity(RequestGetActivity activity);
  Future<ActivityModel> updateActivity(ActivityModel activity);
  Future<bool> updateAllActivities(List<RequestUpdateActivity> activities);
  Future<bool> deleteActivity(ActivityModel activity);
}