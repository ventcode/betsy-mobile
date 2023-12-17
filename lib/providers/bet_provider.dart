import 'dart:convert';
import 'dart:io';

import 'package:betsy_mobile/models/new_bet.dart';
import 'package:betsy_mobile/providers/current_user_bets_provider.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'current_user_provider.dart';

part 'bet_provider.g.dart';

@riverpod
class BetNotifier extends _$BetNotifier {
  @override
  void build() {}

  createBet(NewBet newBet) async {
    final auth = ref.read(asyncCurrentUserProvider.notifier);
    final uri = Uri.parse('http://10.0.2.2:8080/bets');

    final data = auth.state.asData;
    final authCode = await data?.value?.authentication;
    await http.post(uri,
        headers: {
          HttpHeaders.authorizationHeader: '${authCode?.accessToken}',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(newBet.toJson()));
    
    ref.invalidate(currentUserBetsProvider);
  }
}
