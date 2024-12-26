import 'package:equatable/equatable.dart';
import 'package:level_up_life/data/module/user/model/user_model.dart';

class RequestUpdateUser extends Equatable {
  String userId;
  String? name;
  String? email;
  String? profilePicture;
  
  RequestUpdateUser({
    required this.userId,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  RequestUpdateUser.fromModel(UserModel model)
  : userId = model.userId,
    name = model.name,
    email = model.email,
    profilePicture = model.profilePicture;

  UserModel toModel() {
    return UserModel(
      userId: userId,
      name: name,
      email: email,
      profilePicture: profilePicture,
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      if(name != null) 'name': name,
      if(name != null) 'email': email,
      if(profilePicture != null) 'profile_picture': profilePicture,
      'updated_at': DateTime.now().toIso8601String(),
    };
  }

  @override
  List<Object?> get props {
    return [
      name,
      email,
      profilePicture,
    ];
  }
}
