import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/domain/module/activity/request/request_create_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_get_activity.dart';

abstract class ActivityDatasource {
  Future<bool> createActivity(RequestCreateActivity activity, bool isTemporary);
  Future<List<ActivityModel>> getActivities(RequestGetActivity request);
  Future<ActivityModel> getActivity(RequestGetActivity activity);
  Future<ActivityModel> updateActivity(ActivityModel activity);
  Future<bool> deleteActivity(ActivityModel activity);
}