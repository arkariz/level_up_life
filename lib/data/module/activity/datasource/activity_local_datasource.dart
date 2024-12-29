import 'package:level_up_life/data/module/activity/datasource/activity_datasource.dart';
import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/data/services/database/base_box_store/base_box_store.dart';
import 'package:level_up_life/data/services/database/objectbox/objectbox.g.dart';
import 'package:level_up_life/data/utility/handler/datasource_handler.dart';
import 'package:level_up_life/domain/module/activity/request/request_create_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_get_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_update_activity.dart';

class ActivityLocalDatasource extends DatasourceHandler implements ActivityDatasource {  
  ActivityLocalDatasource({required this.baseBoxStore});
  
  final BaseBoxStore baseBoxStore;

  @override
  Future<bool> createActivity(RequestCreateActivity request, {bool isTemporary = false}) async {
    return await handleConnection(() async {
      await baseBoxStore.create<ActivityModel>(request.toModel(), isTemporary);
      return true;
    });
  }

  @override
  Future<ActivityModel> getActivity(RequestGetActivity request) async {
    return await handleConnection(() async {
      return await baseBoxStore.read<ActivityModel>(query: ActivityModel_.uuid.equals(request.uuid!));
    });
  }
  
  @override
  Future<List<ActivityModel>> getActivities({RequestGetActivity? request, bool isTemporary = false}) async {
    return await handleConnection(() async {
      return await baseBoxStore.readAll<ActivityModel>(isTemporary);
    });
  }
  
  @override
  Future<bool> deleteActivity(ActivityModel activity) async {
    return await handleConnection(() async {
      await baseBoxStore.delete<ActivityModel>(query: ActivityModel_.uuid.equals(activity.uuid));
      return true;
    });
  }
  
  @override
  Future<ActivityModel> updateActivity(ActivityModel activity) async {
    return await handleConnection(() async {
      return await baseBoxStore.update<ActivityModel>(model: activity, query: ActivityModel_.uuid.equals(activity.uuid));
    });
  }
  
  @override
  Future<bool> createManyActivities(List<RequestCreateActivity> request, {bool isTemporary = false}) {
    // TODO: implement createManyActivities
    throw UnimplementedError();
  }
  
  @override
  Future<bool> updateAllActivities(List<RequestUpdateActivity> activities) async {
    return await handleConnection(() async {
      await baseBoxStore.updateAll<ActivityModel>(models: activities.map((activity) => activity.toModel()).toList(), query: ActivityModel_.userId.equals(activities.first.userId!));
      return true;
    });
  }
}