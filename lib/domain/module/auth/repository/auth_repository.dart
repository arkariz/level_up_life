import 'package:dartz/dartz.dart';
import 'package:level_up_life/domain/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/auth/request/request_login.dart';
import 'package:level_up_life/domain/module/auth/request/request_register.dart';
import 'package:level_up_life/domain/module/auth/request/request_reset_password.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(RequestLogin request);
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, bool>> registration(RequestRegister request);
  Future<Either<Failure, bool>> sendPasswordResetEmail(RequestResetPassword request);
}
