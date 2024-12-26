import 'package:equatable/equatable.dart';
import 'package:level_up_life/domain/module/user/entity/user.dart';
import 'package:level_up_life/domain/enum/activity_frequency.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Activity extends Equatable {
  String uuid;
  String title;
  Color color;
  ActivityFrequency frequency;
  String description;
  DateTime startDate;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  
  Activity({
    required this.uuid,
    required this.title,
    required this.color,
    required this.frequency,
    required this.description,
    required this.startDate,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  Activity.empty() : this(
    uuid: "",
    title: "",
    color: const Color(0xFF000000),
    frequency: ActivityFrequency.daily,
    description: "",
    startDate: DateTime.now(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    user: User.empty(),
  );
  
  @override
  List<Object> get props => [
    uuid,
    title,
    color,
    frequency,
    description,
    startDate,
    createdAt,
    updatedAt,
    user,
  ];
}