import 'package:dartz/dartz.dart';
import 'package:level_up_life/app/util/pocket.dart';
import 'package:level_up_life/data/module/activity/datasource/activity_local_datasource.dart';
import 'package:level_up_life/data/module/activity/datasource/activity_remote_datasource.dart';
import 'package:level_up_life/data/services/database/objectbox/objectbox.dart';
import 'package:level_up_life/data/utility/handler/repository_handler.dart';
import 'package:level_up_life/app/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/activity/entity/activity.dart';
import 'package:level_up_life/domain/module/activity/repository/activity_repository.dart';
import 'package:level_up_life/domain/module/activity/request/request_create_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_get_activity.dart';

class ImplActivityRepository extends RepositoryHandler implements ActivityRepository {
  ImplActivityRepository({
    required this.localActivityDatasource,
    required this.remoteActivityDatasource,
  });
  
  final ActivityLocalDatasource localActivityDatasource;
  final ActivityRemoteDatasource remoteActivityDatasource;
  final pocket = Pocket();

  @override
  Future<Either<Failure, bool>> createActivity(RequestCreateActivity requestNewActivity) async {
    return handleOperation(
      operationOnline: () async {
        final tempData = await localActivityDatasource.getActivities(isTemporary: true); 
        if (tempData.isNotEmpty) {
          final requestTempActivity = tempData.map((activity) => activity.toRequestCreate()).toList();
          return await remoteActivityDatasource.createManyActivities(requestTempActivity).then((success) async {
            await Objectbox.deleteTemporatyDbFiles();

            return await remoteActivityDatasource.createActivity(requestNewActivity).then((success) async {
              return await localActivityDatasource.createActivity(requestNewActivity);
            });
          });
        } else {
          return await remoteActivityDatasource.createActivity(requestNewActivity).then((success) async {
            return await localActivityDatasource.createActivity(requestNewActivity);
          });
        }
      },
      opperationOffline: () async {
        return await localActivityDatasource.createActivity(requestNewActivity, isTemporary: true);
      }
    );
  }

  @override
  Future<Either<Failure, Activity>> getActivity(RequestGetActivity request) async {
    return handleOperation(
      operationOnline: () async {
        final response = await remoteActivityDatasource.getActivity(request);
        return response.toEntity();
      },
      opperationOffline: () async {
        final response = await localActivityDatasource.getActivity(request);
        return response.toEntity();
      },
    );
  }
  
  @override
  Future<Either<Failure, List<Activity>>> getActivities(RequestGetActivity request) async {
    return handleOperation(
      operationOnline: () async {
        final response = await remoteActivityDatasource.getActivities(request: request);
        return response.map((e) => e.toEntity()).toList();
      },
      opperationOffline: () async {
        final response = await localActivityDatasource.getActivities(request: request);
        return response.map((e) => e.toEntity()).toList();
      },
    );
  }
  
  @override
  Future<Either<Failure, bool>> syncActivitiesOnLaunch() async {
    return handleOperation(
      opperationOffline: () async {
        return true;
      },
      operationOnline: () async {
        final tempData = await localActivityDatasource.getActivities(isTemporary: true); 
        if (tempData.isNotEmpty) {
          final request = tempData.map((activity) => activity.toRequestCreate()).toList();
          return await remoteActivityDatasource.createManyActivities(request).then((success) async {
            await Objectbox.deleteTemporatyDbFiles();
            return true;
          });
        } else {
          final userId = await pocket.getUserId();
          final data = await remoteActivityDatasource.getActivities(request: RequestGetActivity(userId: userId));
          if (data.isNotEmpty) {
            final request = data.map((activity) => activity.toRequestUpdate()).toList();
            await localActivityDatasource.updateAllActivities(request);
          }
          return true;
        }
      },
    );
  }
}
