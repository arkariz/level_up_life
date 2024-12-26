import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:level_up_life/app/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/auth/request/request_login.dart';
import 'package:level_up_life/domain/module/auth/request/request_register.dart';
import 'package:level_up_life/domain/module/auth/request/request_reset_password.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(RequestLogin request);
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, User>> registration(RequestRegister request);
  Future<Either<Failure, bool>> sendPasswordResetEmail(RequestResetPassword request);
}
