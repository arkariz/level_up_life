import 'package:level_up_life/data/module/activity/model/activity_model.dart';

abstract class ActivityDatasource {
  Future<bool> createActivity(ActivityModel activity);
  Future<ActivityModel> getActivity(ActivityModel activity);
}