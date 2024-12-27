import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';

class Activity extends Equatable {
  int id;
  String uuid;
  String userId;
  String title;
  Color color;
  ActivityFrequency frequency;
  String description;
  DateTime startDate;
  DateTime createdAt;
  DateTime updatedAt;
  
  Activity({
    required this.id,
    required this.uuid,
    required this.userId,
    required this.title,
    required this.color,
    required this.frequency,
    required this.description,
    required this.startDate,
    required this.createdAt,
    required this.updatedAt,
  });

  Activity.empty() : this(
    id: 0,
    userId: "",
    uuid: "",
    title: "",
    color: const Color(0xFF000000),
    frequency: ActivityFrequency.daily,
    description: "",
    startDate: DateTime.now(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
  
  @override
  List<Object> get props => [
    id,
    userId,
    uuid,
    title,
    color,
    frequency,
    description,
    startDate,
    createdAt,
    updatedAt,
  ];
}