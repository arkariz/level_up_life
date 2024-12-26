import 'package:firebase_auth/firebase_auth.dart';
import 'package:level_up_life/data/services/firebase/auth/firebase_auth_sevice.dart';
import 'package:level_up_life/data/module/auth/datasource/auth_remote_datasource.dart';
import 'package:level_up_life/data/utility/handler/datasource_handler.dart';
import 'package:level_up_life/domain/module/auth/request/request_login.dart';
import 'package:level_up_life/domain/module/auth/request/request_register.dart';
import 'package:level_up_life/domain/module/auth/request/request_reset_password.dart';

class ImplAuthRemoteDatasource extends DatasourceHandler implements AuthRemoteDatasource {  
  ImplAuthRemoteDatasource({required this.service});
  
  final FirebaseAuthService service;

  @override
  Future<User> login(RequestLogin request) async {
    return await handleRequest(() async {
      return await service.login(email: request.email, password: request.password);
    });
  }
  
  @override
  Future<bool> logout() async {
    return await handleRequest(() async {
      return await service.logout();
    });
  }
  
  @override
  Future<bool> sendPasswordResetEmail(RequestResetPassword request) async {
    return await handleRequest(() async {
      return await service.sendPasswordResetEmail(email: request.email);
    });
  }
  
  @override
  Future<User> registration(RequestRegister request) async {
    return await handleRequest(() async {
      return await service.registration(email: request.email, password: request.password);
    });
  }
}