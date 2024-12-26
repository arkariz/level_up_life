import 'package:dartz/dartz.dart';
import 'package:level_up_life/data/module/user/datasource/user_local_datasource.dart';
import 'package:level_up_life/data/module/user/datasource/user_remote_datasource.dart';
import 'package:level_up_life/data/utility/handler/repository_handler.dart';
import 'package:level_up_life/app/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/user/entity/user.dart';
import 'package:level_up_life/domain/module/user/repository/user_repository.dart';
import 'package:level_up_life/domain/module/user/request/request_create_user.dart';
import 'package:level_up_life/domain/module/user/request/request_get_user.dart';

class ImplUserRepository extends RepositoryHandler implements UserRepository {
  ImplUserRepository({
    required this.localUserDatasource,
    required this.remoteUserDatasource,
  });
  
  final UserLocalDatasource localUserDatasource;
  final UserRemoteDatasource remoteUserDatasource;
  final isOnline = true;

  @override
  Future<Either<Failure, bool>> createUser(RequestCreateUser request) async {
    return handleOperation(
      operationOnline: () async {
        return await remoteUserDatasource.createUser(request);
      },
    );
  }

  @override
  Future<Either<Failure, User>> getUser(RequestGetUser request) async {
    return handleOperation(
      operationOnline: () async {
        return await remoteUserDatasource.getUser(request).then((user) async {
          await localUserDatasource.createUser(RequestCreateUser.fromModel(user)); 
          return user.toEntity();
        });
      }
    );
  }
}
