// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:level_up_life/app/extension/color_extention.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';

class RequestGetActivity extends Equatable {
  int? id;
  String? uuid;
  String? userId;
  String? title;
  Color? color;
  ActivityFrequency? frequency;
  DateTime? startDate;

  RequestGetActivity({
    this.id,
    this.uuid,
    this.userId,
    this.title,
    this.color,
    this.frequency,
    this.startDate,
  });

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (color != null) 'color': color!.hexString,
      if (frequency != null) 'frequency': frequency?.name,
      if (startDate != null) 'start_date': startDate!.toIso8601String(),
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      uuid,
      userId,
      title,
      color,
      frequency,
      startDate,
    ];
  }
}
