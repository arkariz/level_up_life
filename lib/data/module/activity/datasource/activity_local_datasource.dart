import 'package:level_up_life/data/module/activity/datasource/activity_datasource.dart';
import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/data/services/database/objectbox/objectbox.g.dart';
import 'package:level_up_life/data/utility/handler/datasource_handler.dart';
import 'package:level_up_life/domain/module/activity/request/request_create_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_get_activity.dart';

class ActivityLocalDatasource extends DatasourceHandler implements ActivityDatasource {  
  ActivityLocalDatasource({required this.boxStore, required this.temBoxStore});
  
  final Store boxStore;
  final Store temBoxStore;

  @override
  Future<bool> createActivity(RequestCreateActivity request, bool isTemporary) async {
    return await handleConnection(() async {
      if (isTemporary) {
        final tempBox = temBoxStore.box<ActivityModel>();
        await tempBox.putAsync(request.toModel());

        final box = boxStore.box<ActivityModel>();
        await box.putAsync(request.toModel());
        return true;
      } else {
        final box = boxStore.box<ActivityModel>();
        await box.putAsync(request.toModel());
        return true;
      }
    });
  }

  @override
  Future<ActivityModel> getActivity(RequestGetActivity request) async {
    return await handleConnection(() async {
      final box = boxStore.box<ActivityModel>();
      final result = box.query(ActivityModel_.uuid.equals(request.uuid!)).build().findFirst();
      return result!;
    });
  }
  
  @override
  Future<List<ActivityModel>> getActivities(RequestGetActivity request) async {
    return await handleConnection(() async {
      final box = boxStore.box<ActivityModel>();
      final result = await box.getAllAsync();
      return result.map((e) => e).toList();
    });
  }
}