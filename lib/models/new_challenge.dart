import 'package:json_annotation/json_annotation.dart';

part 'new_challenge.g.dart';

@JsonSerializable(createFactory: false)
class NewChallenge {
  final int amount;
  final String title;
  @JsonKey(name: 'challenged_id')
  final int challengedId;
  @JsonKey(name: 'challenger_id')
  final int challengerId;

  NewChallenge(
      {required this.amount,
      required this.title,
      required this.challengedId,
      required this.challengerId});

  Map<String, dynamic> toJson() => _$NewChallengeToJson(this);
}
