import 'package:level_up_life/data/module/user/datasource/user_datasource.dart';
import 'package:level_up_life/data/module/user/model/user_model.dart';
import 'package:level_up_life/data/services/database/objectbox/objectbox.g.dart';
import 'package:level_up_life/data/utility/handler/datasource_handler.dart';
import 'package:level_up_life/domain/module/user/request/request_create_user.dart';
import 'package:level_up_life/domain/module/user/request/request_get_user.dart';
import 'package:level_up_life/domain/module/user/request/request_update_user.dart';

class UserLocalDatasource extends DatasourceHandler implements UserDatasource {  
  UserLocalDatasource({required this.boxStore});
  
  final Store boxStore;

  @override
  Future<bool> createUser(RequestCreateUser user) async {
    return await handleConnection(() async {
      final box = boxStore.box<UserModel>();
      await box.putAsync(user.toModel());
      return true;
    });
  }

  @override
  Future<UserModel> getUser(RequestGetUser request) async {
    return await handleConnection(() async {
      final box = boxStore.box<UserModel>();
      final result = await box.getAllAsync();

      return result.first;
    });
  }

  @override
  Future<bool> updateUser(RequestUpdateUser user) async {
    return await handleConnection(() async {
      final box = boxStore.box<UserModel>();
      await box.putAsync(user.toModel(), mode: PutMode.update);
      return true;
    });
  }
  
  @override
  Future<bool> deleteUser(RequestGetUser user) async {
    return await handleConnection(() async {
      final box = boxStore.box<UserModel>();
      final result = await getUser(user); 
      await box.removeAsync(result.id);
      return true;
    });
  }
}