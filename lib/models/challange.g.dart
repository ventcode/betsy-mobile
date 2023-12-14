// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challange _$ChallangeFromJson(Map<String, dynamic> json) => Challange(
      challanger: User.fromJson(json['challanger'] as Map<String, dynamic>),
      opponent: User.fromJson(json['opponent'] as Map<String, dynamic>),
      date: json['date'] as String,
      status: json['status'] as String,
      value: json['value'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ChallangeToJson(Challange instance) => <String, dynamic>{
      'challanger': instance.challanger,
      'opponent': instance.opponent,
      'value': instance.value,
      'date': instance.date,
      'status': instance.status,
      'description': instance.description,
    };
