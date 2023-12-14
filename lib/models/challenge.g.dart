// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
      id: json['id'] as String,
      challenger: User.fromJson(json['challenger'] as Map<String, dynamic>),
      opponent: User.fromJson(json['opponent'] as Map<String, dynamic>),
      date: json['date'] as String,
      status: json['status'] as String,
      value: json['value'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'challenger': instance.challenger,
      'opponent': instance.opponent,
      'value': instance.value,
      'date': instance.date,
      'status': instance.status,
      'description': instance.description,
      'id': instance.id,
    };
