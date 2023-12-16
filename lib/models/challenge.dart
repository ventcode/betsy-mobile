import 'package:betsy_mobile/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge.g.dart';
// 0: new, 1: accepted, 2: started, 3: finished, 4: rejected

@JsonSerializable()
class Challenge {
  final User challenger;
  @JsonKey(name: 'challenged')
  final User opponent;
  final String title;
  final int id, amount;
  final int status; // TODO: Make this an enum
  @JsonKey(name: 'challenger_won')
  final bool? challengerWon;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  Challenge(
      {required this.id,
      required this.challenger,
      required this.opponent,
      required this.status,
      required this.title,
      required this.challengerWon,
      required this.amount,
      required this.updatedAt,
      required this.createdAt,
      this.deletedAt});

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeToJson(this);

  map(Challenge Function(dynamic listElement) param0) {}
}
