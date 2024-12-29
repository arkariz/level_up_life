import 'package:dartz/dartz.dart';
import 'package:level_up_life/app/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/activity/entity/activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_create_activity.dart';
import 'package:level_up_life/domain/module/activity/request/request_get_activity.dart';

abstract class ActivityRepository {
  Future<Either<Failure, bool>> createActivity(RequestCreateActivity request);
  Future<Either<Failure, Activity>> getActivity(RequestGetActivity request);
  Future<Either<Failure, List<Activity>>> getActivities(RequestGetActivity request);
  Future<Either<Failure, bool>> syncActivitiesOnLaunch();
}