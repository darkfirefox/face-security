import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  Notification({this.id, this.title, this.body, this.dateTime, this.viewable});
  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);
  final int id;
  final String title;
  final String body;
  final DateTime dateTime;
  final bool viewable;
}