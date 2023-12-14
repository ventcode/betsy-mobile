import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

//  THIS IS THE MOCK FOR NOW TO SHOW HOW THE PACKAGE WORKS

@JsonSerializable()
class Auth {
  /// The generated code assumes these values exist in JSON.

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final String key;
  final String activity;
  final String type;
  final int participants;
  final double price;

  Auth(
      {required this.key,
      required this.activity,
      required this.type,
      required this.participants,
      required this.price});

  /// Connect the generated [_$AuthFromJson] function to the `fromJson`
  /// factory.
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  /// Connect the generated [_$AuthToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
