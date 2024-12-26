import 'package:level_up_life/domain/module/user/entity/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserModel{
  @Id()
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  String userId;

  String? name;
  String? email;
  String? profilePicture;

  @Property(type: PropertyType.dateNano)
  DateTime? createdAt;
  @Property(type: PropertyType.dateNano)
  DateTime? updatedAt;
  
  UserModel({
    this.id = 0,
    required this.userId,
    this.name,
    this.email,
    this.profilePicture,
    this.createdAt,
    this.updatedAt,
  });

  User toEntity() {
    return User(
      userId: userId,
      name: name ?? "",
      email: email ?? "",
      profilePicture: profilePicture ?? "",
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  factory UserModel.fromJson(List<dynamic> json) {
    final data = json.firstOrNull;
    return UserModel(
      id: data['id'],
      userId: data['user_id'],
      name: data['name'],
      email: data['email'],
      profilePicture: data['profile_picture'],
      createdAt: DateTime.parse(data['created_at']),
      updatedAt: DateTime.parse(data['updated_at']),
    );
  }
}