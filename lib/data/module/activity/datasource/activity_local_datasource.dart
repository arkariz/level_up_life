import 'package:level_up_life/data/module/activity/datasource/activity_datasource.dart';
import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/data/services/database/objectbox/objectbox.g.dart';
import 'package:level_up_life/data/utility/handler/datasource_handler.dart';

class ActivityLocalDatasource extends DatasourceHandler implements ActivityDatasource {  
  ActivityLocalDatasource({required this.boxStore});
  
  final Store boxStore;

  @override
  Future<bool> createActivity(ActivityModel activity) async {
    try {
      final box = boxStore.box<ActivityModel>();
      await box.putAsync(activity);
      return true;  
    } catch (e) {
      return false;
    }
  }

  @override
  Future<ActivityModel> getActivity(ActivityModel activity) async {
    try {
      final box = boxStore.box<ActivityModel>();
      final result = box.query(ActivityModel_.uuid.equals(activity.uuid)).build().findFirst();
      return result!;
    } catch (e) {
      rethrow;
    }
  }
}