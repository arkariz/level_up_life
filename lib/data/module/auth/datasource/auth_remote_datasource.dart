import 'package:level_up_life/domain/module/auth/request/request_login.dart';
import 'package:level_up_life/domain/module/auth/request/request_register.dart';
import 'package:level_up_life/domain/module/auth/request/request_reset_password.dart';

abstract class AuthRemoteDatasource {
  Future<bool> login(RequestLogin request);
  Future<bool> registration(RequestRegister request);
  Future<bool> logout();
  Future<bool> sendPasswordResetEmail(RequestResetPassword request);
}