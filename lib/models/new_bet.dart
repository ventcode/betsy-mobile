import 'package:json_annotation/json_annotation.dart';

part 'new_bet.g.dart';

@JsonSerializable(createFactory: false)
class NewBet {
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'challenge_id')
  final int challengeId;
  @JsonKey(name: 'bet_on_challenger')
  final bool betOnChallenger;
  final int amount;

  NewBet(
      {required this.userId,
      required this.challengeId,
      required this.betOnChallenger,
      required this.amount});

  Map<String, dynamic> toJson() => _$NewBetToJson(this);
}
