import 'package:level_up_life/app/util/hex_color.dart';
import 'package:objectbox/objectbox.dart';
import 'package:level_up_life/domain/module/activity/entity/activity.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';

@Entity()
class ActivityModel{
  @Id()
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  String uuid;

  String? userId;
  String? title;
  String? color;
  String? frequency;
  String? description;

  @Property(type: PropertyType.dateNano)
  DateTime? startDate;
  @Property(type: PropertyType.dateNano)
  DateTime? createdAt;
  @Property(type: PropertyType.dateNano)
  DateTime? updatedAt;
  
  ActivityModel({
    this.id = 0,
    required this.uuid,
    this.userId,
    this.title,
    this.color,
    this.frequency,
    this.description,
    this.startDate,
    this.createdAt,
    this.updatedAt,
  });

  Activity toEntity() {
    return Activity(
      id: id,
      uuid: uuid,
      userId: userId ?? "",
      title: title ?? "",
      color: HexColor(color ?? "#FFFFFF"),
      frequency: frequency != null ? ActivityFrequency.values.byName(frequency!) : ActivityFrequency.daily,
      description: description ?? "",
      startDate: startDate ?? DateTime.now(),
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      uuid: json['uuid'],
      userId: json['user_id'],
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