// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      surname: json['surname'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      age: json['age'] as int?,
      ventBucks: json['ventBucks'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'profileImageUrl': instance.profileImageUrl,
      'age': instance.age,
      'ventBucks': instance.ventBucks,
    };
