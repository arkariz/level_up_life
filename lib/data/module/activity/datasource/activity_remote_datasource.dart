import 'package:level_up_life/data/module/activity/datasource/activity_datasource.dart';
import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/data/services/service_manager/supabase_manager.dart';
import 'package:level_up_life/data/services/service_manager/supabase_service_config.dart';
import 'package:level_up_life/data/utility/handler/datasource_handler.dart';
import 'package:level_up_life/domain/module/activity/request/request_create_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_get_activity.dart';

class ActivityRemoteDatasource extends DatasourceHandler implements ActivityDatasource {  
  ActivityRemoteDatasource({required this.manager, required this.config});
  
  final SupabaseManager manager;
  final SupabaseServiceConfig config;

  @override
  Future<bool> createActivity(RequestCreateActivity request, bool isTemporary) async {
    await handleRequest(() async {
      return await manager.post(
        endpoint: _EndPoint.createActivity,
        data: request.toJson(),
        additionalHeaders: config.tokenHeader,
      );
    });

    return true;
  }

  @override
  Future<ActivityModel> getActivity(RequestGetActivity request) async {
    final response = await handleRequest(() async {
      return await manager.get(
        endpoint: _EndPoint.activityId(request.userId!),
        additionalHeaders: config.tokenHeader,
      );
    }) as List<dynamic>;

    return handleDecode(() => response.map((e) => ActivityModel.fromJson(e)).first);
  }
  
  @override
  Future<List<ActivityModel>> getActivities(RequestGetActivity request) async {
    final response = await handleRequest(() async {
      return await manager.get(
        endpoint: _EndPoint.activities(request.userId!),
        additionalHeaders: config.tokenHeader,
      );
    }) as List<dynamic>;
    
    return handleDecode(() => response.map((e) => ActivityModel.fromJson(e)).toList());
  }
  
  @override
  Future<bool> deleteActivity(ActivityModel activity) {
    // TODO: implement deleteActivity
    throw UnimplementedError();
  }
  
  @override
  Future<ActivityModel> updateActivity(ActivityModel activity) {
    // TODO: implement updateActivity
    throw UnimplementedError();
  }
}

class _EndPoint {
  static String createActivity = "activity";
  static String activities(String userId) => "activity?user_id=eq.$userId"; 
  static String activityId(String uuid)=> "activity?uuid=eq.$uuid"; 
}
