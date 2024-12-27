import 'package:equatable/equatable.dart';
import 'package:level_up_life/app/extension/color_extention.dart';
import 'package:level_up_life/app/util/uuid_gen.dart';
import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';
import 'package:nylo_framework/nylo_framework.dart';

class RequestCreateActivity extends Equatable {
  final String userId;
  final String title;
  final Color? color;
  final ActivityFrequency frequency;
  final String? description;
  final DateTime startDate;

  RequestCreateActivity({
    required this.userId,
    required this.title,
    required this.color,
    required this.frequency,
    required this.description,
    required this.startDate,
  });

  final uuid = UuidGen.generate();

  ActivityModel toModel() => ActivityModel(
    uuid: uuid,
    title: title,
    color: color?.hexString ?? "#FFFFFF",
    frequency: frequency.name,
    description: description,
    startDate: startDate,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title,
      'color': color?.hexString ?? "#FFFFFF",
      'frequency': frequency.name,
      if (description != null) 'description': description,
      'start_date': startDate.toDateTimeString(),
      'created_at': DateTime.now().toDateTimeString(),
      'updated_at': DateTime.now().toDateTimeString(),
      'user_id': userId,
    };
  }

  @override
  List<Object?> get props {
    return [
      title,
      color,
      frequency,
      description,
      startDate,
    ];
  }
}
