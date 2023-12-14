import 'package:betsy_mobile/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge.g.dart';

@JsonSerializable()
class Challenge {
  final User challenger;
  final User opponent;
  final String value, date, status, description, id;

  Challenge(
      {
      required this.id,
      required this.challenger,
      required this.opponent,
      required this.date,
      required this.status,
      required this.value,
      required this.description});

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeToJson(this);

  map(Challenge Function(dynamic listElement) param0) {}
}
