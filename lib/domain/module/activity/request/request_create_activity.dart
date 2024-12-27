import 'package:equatable/equatable.dart';
import 'package:level_up_life/app/extension/color_extention.dart';
import 'package:level_up_life/app/util/uuid_gen.dart';
import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';
import 'package:nylo_framework/nylo_framework.dart';

class RequestCreateActivity extends Equatable {
  final uuid = UuidGen.generate();
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


  ActivityModel toModel() => ActivityModel(
    uuid: uuid,
    userId: userId,
    title: title,
    color: color?.hexString,
    frequency: frequency.name,
    description: description,
    startDate: startDate,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'uuid': uuid,
      'title': title,
      if (color != null) 'color': color!.hexString,
      'frequency': frequency.name,
      if (description != null) 'description': description,
      'start_date': startDate.toDateTimeString(),
      'created_at': DateTime.now().toDateTimeString(),
      'updated_at': DateTime.now().toDateTimeString(),
    };
  }

  @override
  List<Object?> get props {
    return [
      uuid,
      userId,
      title,
      color,
      frequency,
      description,
      startDate,
    ];
  }
}
