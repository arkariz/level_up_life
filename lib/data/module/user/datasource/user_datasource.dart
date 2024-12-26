import 'package:level_up_life/data/module/user/model/user_model.dart';
import 'package:level_up_life/domain/module/user/request/request_create_user.dart';
import 'package:level_up_life/domain/module/user/request/request_get_user.dart';
import 'package:level_up_life/domain/module/user/request/request_update_user.dart';

abstract class UserDatasource {
  Future<bool> createUser(RequestCreateUser user);
  Future<UserModel> getUser(RequestGetUser user);
  Future<bool> updateUser(RequestUpdateUser user);
  Future<bool> deleteUser(RequestGetUser user);
}