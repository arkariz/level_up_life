import 'package:equatable/equatable.dart';
import 'package:level_up_life/data/module/user/model/user_model.dart';

class RequestCreateUser extends Equatable {
  String userId;
  String name;
  String email;
  String profilePicture;
  
  RequestCreateUser({
    required this.userId,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  RequestCreateUser.fromModel(UserModel model)
  : userId = model.userId,
    name = model.name ?? "",
    email = model.email ?? "",
    profilePicture = model.profilePicture ?? "";

  UserModel toModel() {
    return UserModel(
      userId: userId,
      name: name,
      email: email,
      profilePicture: profilePicture,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'email': email,
      'profile_picture': profilePicture,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    };
  }

  @override
  List<Object> get props {
    return [
      name,
      email,
      profilePicture,
    ];
  }
}
