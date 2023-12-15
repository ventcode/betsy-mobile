// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
      id: json['id'] as int,
      challenger: User.fromJson(json['challenger'] as Map<String, dynamic>),
      opponent: User.fromJson(json['challenged'] as Map<String, dynamic>),
      status: json['status'] as int,
      title: json['title'] as String,
      challengerWon: json['challenger_won'] as bool?,
      amount: json['amount'] as int,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'challenger': instance.challenger,
      'challenged': instance.opponent,
      'title': instance.title,
      'id': instance.id,
      'amount': instance.amount,
      'status': instance.status,
      'challenger_won': instance.challengerWon,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
