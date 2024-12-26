import 'package:equatable/equatable.dart';

class User extends Equatable {
  String userId;
  String name;
  String email;
  String profilePicture;
  DateTime createdAt;
  DateTime updatedAt;
  
  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.createdAt,
    required this.updatedAt,
  });

  User.empty() : this(
    userId: "",
    name: "",
    email: "",
    profilePicture: "",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  List<Object> get props {
    return [
      userId,
      name,
      email,
      profilePicture,
      createdAt,
      updatedAt,
    ];
  }
}
