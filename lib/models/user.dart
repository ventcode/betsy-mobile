import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String surname;
  final String profileImageUrl;
  final int? age;
  final int? ventBucks;

  User(
      {required this.name,
      required this.surname,
      required this.profileImageUrl,
      this.age,
      this.ventBucks});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
