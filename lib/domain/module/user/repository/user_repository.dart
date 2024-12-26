import 'package:dartz/dartz.dart';
import 'package:level_up_life/app/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/user/entity/user.dart';
import 'package:level_up_life/domain/module/user/request/request_create_user.dart';
import 'package:level_up_life/domain/module/user/request/request_get_user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(RequestGetUser request);
  Future<Either<Failure, bool>> createUser(RequestCreateUser request);
}