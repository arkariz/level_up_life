import 'package:dartz/dartz.dart';
import 'package:level_up_life/data/module/activity/datasource/activity_local_datasource.dart';
import 'package:level_up_life/data/module/activity/datasource/activity_remote_datasource.dart';
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

  @override
  Future<Either<Failure, bool>> createActivity(RequestCreateActivity request) async {
    return handleOperation(
      operationOnline: () async {
        return await remoteActivityDatasource.createActivity(request, false).then((success) async {
          return await localActivityDatasource.createActivity(request, false);
        });
      },
      opperationOffline: () async {
        return await localActivityDatasource.createActivity(request, true);
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
        final response = await remoteActivityDatasource.getActivities(request);
        return response.map((e) => e.toEntity()).toList();
      },
      opperationOffline: () async {
        final response = await localActivityDatasource.getActivities(request);
        return response.map((e) => e.toEntity()).toList();
      },
    );
  }
}
