import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:level_up_life/data/module/auth/datasource/auth_remote_datasource.dart';
import 'package:level_up_life/data/utility/handler/repository_handler.dart';
import 'package:level_up_life/app/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/auth/repository/auth_repository.dart';
import 'package:level_up_life/domain/module/auth/request/request_login.dart';
import 'package:level_up_life/domain/module/auth/request/request_register.dart';
import 'package:level_up_life/domain/module/auth/request/request_reset_password.dart';

class ImplAuthRepository extends RepositoryHandler implements AuthRepository {
  ImplAuthRepository(this._remoteDataSource);
  
  final AuthRemoteDatasource _remoteDataSource;

  @override
  Future<Either<Failure, User>> login(RequestLogin request) async {
    return handleOperation(
      operationOnline: () async {
        final response = await _remoteDataSource.login(request);
        return response;
      }
    );
  }
  
  @override
  Future<Either<Failure, bool>> logout() async {
    return handleOperation(
      operationOnline: () async {
        return await _remoteDataSource.logout();
      }
    );
  }
  
  @override
  Future<Either<Failure, bool>> sendPasswordResetEmail(RequestResetPassword request) {
    return handleOperation(
      operationOnline: () async {
        return await _remoteDataSource.sendPasswordResetEmail(request);
      }
    );
  }
  
  @override
  Future<Either<Failure, User>> registration(RequestRegister request) async {
    return handleOperation(
      operationOnline: () async {
        return await _remoteDataSource.registration(request);
      }
    );
  }
}
