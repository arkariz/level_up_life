import 'package:level_up_life/data/module/user/datasource/user_datasource.dart';
import 'package:level_up_life/data/module/user/model/user_model.dart';
import 'package:level_up_life/data/services/service_manager/supabase_manager.dart';
import 'package:level_up_life/data/services/service_manager/supabase_service_config.dart';
import 'package:level_up_life/data/utility/handler/datasource_handler.dart';
import 'package:level_up_life/domain/module/user/request/request_create_user.dart';
import 'package:level_up_life/domain/module/user/request/request_get_user.dart';
import 'package:level_up_life/domain/module/user/request/request_update_user.dart';

class UserRemoteDatasource extends DatasourceHandler implements UserDatasource {  
  UserRemoteDatasource({required this.manager, required this.config});
  
  final SupabaseManager manager;
  final SupabaseServiceConfig config;

  @override
  Future<UserModel> getUser(RequestGetUser request) async{
    final response = await handleRequest(() async {
      return await manager.get(
        endpoint: _EndPoint.userid(request.userId),
        additionalHeaders: config.tokenHeader,
      );
    });

    return handleDecode(() => UserModel.fromJson(response));
  }
  
  @override
  Future<bool> createUser(RequestCreateUser request) async {
    await handleRequest(() async {
      return await manager.post(
        endpoint: _EndPoint.createUser,
        data: request.toJson(),
        additionalHeaders: config.tokenHeader,
      );
    });

    return true;
  }

  @override
  Future<bool> deleteUser(RequestGetUser user) async {
    await handleRequest(() async {
      return await manager.delete(
        endpoint: _EndPoint.userid(user.userId),
        additionalHeaders: config.tokenHeader,
      );
    });

    return true;
  }

  @override
  Future<bool> updateUser(RequestUpdateUser user) async {
    await handleRequest(() async {
      return await manager.patch(
        endpoint: _EndPoint.userid(user.userId),
        data: user.toJson(),
        additionalHeaders: config.tokenHeader,
      );
    });

    return true;
  }
}

class _EndPoint {
  static String createUser = "user";
  static String userid(String userId)=> "user?user_id=eq.$userId";
}
