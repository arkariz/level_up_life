import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:level_up_life/app/extension/color_extention.dart';
import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/data/module/user/model/user_model.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';

class RequestUpdateActivity extends Equatable {
  final int id;
  final String uuid;
  final String? title;
  final Color? color;
  final ActivityFrequency? frequency;
  final String? description;
  final DateTime? startDate;
  final UserModel? user;

  const RequestUpdateActivity({
    required this.id,
    required this.uuid,
    this.title,
    this.color,
    this.frequency,
    this.description,
    this.startDate,
    this.user,
  });


  ActivityModel toModel() => ActivityModel(
    uuid: uuid,
    title: title,
    color: color?.hexString,
    frequency: frequency?.name,
    description: description,
    startDate: startDate,
    updatedAt: DateTime.now(),
  );

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      if (title != null) 'title': title,
      if (color != null) 'color': color?.hexString,
      if (frequency != null) 'frequency': frequency?.name,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate!.toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
      if (user != null) 'user_id': user!.userId,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      uuid,
      title,
      color,
      frequency,
      description,
      startDate,
      user,
    ];
  }
}
