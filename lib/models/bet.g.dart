// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bet _$BetFromJson(Map<String, dynamic> json) => Bet(
      id: json['id'] as int,
      challengeId: json['challenge_id'] as int,
      betOnChallenger: json['bet_on_challenger'] as bool,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$BetToJson(Bet instance) => <String, dynamic>{
      'id': instance.id,
      'challenge_id': instance.challengeId,
      'bet_on_challenger': instance.betOnChallenger,
      'amount': instance.amount,
    };
