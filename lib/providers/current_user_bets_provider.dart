import 'dart:convert';
import 'dart:io';

import 'package:betsy_mobile/models/bet.dart';
import 'package:betsy_mobile/providers/current_api_user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'current_user_provider.dart';

part 'current_user_bets_provider.g.dart';

@riverpod
Future<List<Bet>> currentUserBets(CurrentUserBetsRef ref) async {
  final currentAPIUser = ref.watch(currentAPIUserProvider);
  final uri = Uri.parse(
      'http://10.0.2.2:8080/users/${currentAPIUser.requireValue.id}/bets');
  final auth = ref.watch(asyncCurrentUserProvider);
  final authCode = await auth.value?.authentication;

  final http.Response response = await http.get(uri, headers: {
    HttpHeaders.authorizationHeader: '${authCode?.accessToken}',
  });

  final body = jsonDecode(response.body);
  return (body['data'] as List).map((bet) => Bet.fromJson(bet)).toList();
}
