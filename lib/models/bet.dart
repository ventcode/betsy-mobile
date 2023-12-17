import 'package:betsy_mobile/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bet.g.dart';

@JsonSerializable()
class Bet {
  final int id;
  @JsonKey(name: 'challenge_id')
  final int challengeId;
  @JsonKey(name: 'bet_on_challenger')
  final bool betOnChallenger;
  final int amount;

  Bet({
    required this.id,
    required this.challengeId,
    required this.betOnChallenger,
    required this.amount,
  });

  Map<String, dynamic> toJson() => _$BetToJson(this);

  factory Bet.fromJson(Map<String, dynamic> json) => _$BetFromJson(json);
}
