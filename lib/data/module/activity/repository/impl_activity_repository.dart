import 'package:dartz/dartz.dart';
import 'package:level_up_life/data/module/activity/datasource/activity_local_datasource.dart';
import 'package:level_up_life/data/utility/handler/repository_handler.dart';
import 'package:level_up_life/app/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/activity/entity/activity.dart';
import 'package:level_up_life/domain/module/activity/repository/activity_repository.dart';
import 'package:level_up_life/domain/module/activity/request/request_create_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_get_activity.dart';

class ImplActivityRepository extends RepositoryHandler implements ActivityRepository {
  ImplActivityRepository({
    required this.localActivityDatasource,
  });
  
  final ActivityLocalDatasource localActivityDatasource;

  @override
  Future<Either<Failure, bool>> createActivity(RequestCreateActivity request) async {
    return handleOperation(
      operationOnline: () async {
        final response = await localActivityDatasource.createActivity(request.toModel());
        return response;
      }
    );
  }

  @override
  Future<Either<Failure, Activity>> getActivity(RequestGetActivity request) async {
    return handleOperation(
      operationOnline: () async {
        final response = await localActivityDatasource.getActivity(request.toModel());
        return response.toEntity();
      }
    );
  }
}
