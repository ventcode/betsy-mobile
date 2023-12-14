import 'package:betsy_mobile/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challange.g.dart';

@JsonSerializable()
class Challange {
  final User challanger;
  final User opponent;
  final String value, date, status, description;

  Challange(
      {required this.challanger,
      required this.opponent,
      required this.date,
      required this.status,
      required this.value,
      required this.description});

  factory Challange.fromJson(Map<String, dynamic> json) =>
      _$ChallangeFromJson(json);

  Map<String, dynamic> toJson() => _$ChallangeToJson(this);

  map(Challange Function(dynamic listElement) param0) {}
}
