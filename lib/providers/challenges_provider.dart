import 'dart:convert';

import 'package:betsy_mobile/models/challenge.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

// Necessary for code-generation to work
part 'challenges_provider.g.dart';

@riverpod
Future<List<Challenge>> challenges(ChallengesRef ref) async {
  final uri = Uri.parse('http://10.0.2.2:8080/challenges');

  final http.Response response = await http.get(uri);

  final body = jsonDecode(response.body);

  return (body['data'] as List).map((listElement) => Challenge.fromJson(listElement)).toList();
}
