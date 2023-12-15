import 'dart:convert';

import 'package:betsy_mobile/models/challenge.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_provider.g.dart';

@riverpod
Future<Challenge> challenge(ChallengeRef ref, int id) async {
  final uri = Uri.parse('http://10.0.2.2:8080/challenges/$id');
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  return Challenge.fromJson(json['challenge']);
}
