// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:equatable/equatable.dart';

import 'package:level_up_life/app/extension/color_extention.dart';
import 'package:level_up_life/data/module/activity/model/activity_model.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';

class RequestGetActivity extends Equatable {
  final String uuid;
  final String title;
  final Color color;
  final ActivityFrequency frequency;
  final String description;
  final DateTime startDate;

  const RequestGetActivity({
    required this.uuid,
    required this.title,
    required this.color,
    required this.frequency,
    required this.description,
    required this.startDate,
  });

  ActivityModel toModel() => ActivityModel(
    uuid: uuid,
    title: title,
    color: color.hexString,
    frequency: frequency.name,
    description: description,
    startDate: startDate,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  List<Object> get props {
    return [
      uuid,
      title,
      color,
      frequency,
      description,
      startDate,
    ];
  }
}
