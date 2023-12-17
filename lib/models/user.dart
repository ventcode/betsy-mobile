import 'package:json_annotation/json_annotation.dart';

import 'challenge.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  @JsonKey(name: 'money_amount')
  final int moneyAmount;

  User({required this.moneyAmount, required this.id});

  bool participatesIn(Challenge challenge) {
    return [challenge.challenger.id, challenge.opponent.id].contains(id);
  }

  bool canBetOn(Challenge challenge) {
    return !participatesIn(challenge);
  }

  bool canAccept(Challenge challenge) {
    return challenge.canBeAccepted && challenge.opponent.id == id;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
