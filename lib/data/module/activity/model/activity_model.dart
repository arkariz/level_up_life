import 'package:level_up_life/app/util/hex_color.dart';
import 'package:level_up_life/data/module/user/model/user_model.dart';
import 'package:level_up_life/domain/module/user/entity/user.dart';
import 'package:objectbox/objectbox.dart';
import 'package:level_up_life/domain/module/activity/entity/activity.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';

@Entity()
class ActivityModel{
  @Id()
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  String uuid;

  String title;
  String color;
  String frequency;
  String? description;

  @Property(type: PropertyType.dateNano)
  DateTime startDate;
  @Property(type: PropertyType.dateNano)
  DateTime createdAt;
  @Property(type: PropertyType.dateNano)
  DateTime updatedAt;

  final user = ToOne<UserModel>();
  
  ActivityModel({
    this.id = 0,
    required this.uuid,
    required this.title,
    required this.color,
    required this.frequency,
    this.description,
    required this.startDate,
    required this.createdAt,
    required this.updatedAt,
  });

  Activity toEntity() {
    return Activity(
      uuid: uuid,
      title: title,
      color: HexColor(color),
      frequency: ActivityFrequency.values.byName(frequency),
      description: description ?? "",
      startDate: startDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      user: user.target?.toEntity() ?? User.empty(),
    );
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      uuid: json['uuid'],
      title: json['title'],
      color: json['color'],
      frequency: json['frequency'],
      description: json['description'],
      startDate: DateTime.tryParse(json['start_date']) ?? DateTime.now(),
      createdAt: DateTime.tryParse(json['created_at']) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at']) ?? DateTime.now(),
    );
  }
}