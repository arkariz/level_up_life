import 'package:equatable/equatable.dart';
import 'package:level_up_life/data/module/user/model/user_model.dart';

class RequestGetUser extends Equatable {
  String userId;
  String name;
  String email;
  String profilePicture;
  
  RequestGetUser({
    required this.userId,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

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
