import 'dart:convert';
import 'dart:io';

import 'package:betsy_mobile/models/challenge.dart';
import 'package:betsy_mobile/models/new_challenge.dart';
import 'package:betsy_mobile/providers/challenge_provider.dart';
import 'package:betsy_mobile/providers/current_user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Necessary for code-generation to work
part 'challenges_provider.g.dart';

@riverpod
class ChallengesNotifier extends _$ChallengesNotifier {
  @override
  FutureOr<List<Challenge>> build() async {
    final uri = Uri.parse('http://10.0.2.2:8080/challenges');

    final http.Response response = await http.get(uri);

    final body = jsonDecode(response.body);

    return (body['data'] as List)
        .map((listElement) => Challenge.fromJson(listElement))
        .toList();
  }

  Future<void> addChallenge(NewChallenge newChallenge) async {
    final auth = ref.read(asyncCurrentUserProvider.notifier);
    final uri = Uri.parse('http://10.0.2.2:8080/challenges');

    final data = auth.state.asData;
    final authCode = await data?.value?.authentication;
    await http.post(uri,
        headers: {
          HttpHeaders.authorizationHeader: '${authCode?.accessToken}',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(newChallenge.toJson()));

    ref.invalidateSelf();
  }

  Future<void> acceptChallenge(Challenge challenge) async {
    final auth = ref.read(asyncCurrentUserProvider.notifier);
    final uri = Uri.parse('http://10.0.2.2:8080/challenges/${challenge.id}');

    final data = auth.state.asData;
    final authCode = await data?.value?.authentication;
    await http.patch(uri,
        headers: {
          HttpHeaders.authorizationHeader: '${authCode?.accessToken}',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode({"status": 1}));

    ref.invalidateSelf();
    ref.invalidate(challengeProvider(challenge.id));
  }
}
