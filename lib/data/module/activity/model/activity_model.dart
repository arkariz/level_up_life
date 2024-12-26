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
  String description;

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
    required this.description,
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
      description: description,
      startDate: startDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      user: user.target?.toEntity() ?? User.empty(),
    );
  }
}