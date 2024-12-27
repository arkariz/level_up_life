// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:level_up_life/app/extension/color_extention.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';

class RequestGetActivity extends Equatable {
  String? userId;
  String? uuid;
  String? title;
  Color? color;
  ActivityFrequency? frequency;
  DateTime? startDate;

  RequestGetActivity({
    this.userId,
    this.uuid,
    this.title,
    this.color,
    this.frequency,
    this.startDate,
  });

  Map<String, dynamic> toJson() {
    return {
      if (userId != null) 'user_id': userId,
      if (uuid != null) 'uuid': uuid,
      if (title != null) 'title': title,
      if (color != null) 'color': color!.hexString,
      if (frequency != null) 'frequency': frequency?.name,
      if (startDate != null) 'start_date': startDate!.toIso8601String(),
    };
  }

  @override
  List<Object?> get props {
    return [
      uuid,
      title,
      color,
      frequency,
      startDate,
    ];
  }
}
