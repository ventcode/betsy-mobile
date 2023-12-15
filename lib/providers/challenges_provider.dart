import 'dart:convert';
import 'dart:io';

import 'package:betsy_mobile/models/challenge.dart';
import 'package:betsy_mobile/providers/auth_provider.dart';
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

  Future<void> addChallenge(Challenge challenge) async {
    final auth = ref.read(asyncCurrentUserProvider.notifier);
    final uri = Uri.parse('http://10.0.2.2:8080/challenges');

    auth.state.whenData((value) async {
        final authCode = await value?.authentication;
        final response = await http.post(uri, headers: {
          HttpHeaders.authorizationHeader: '${authCode?.accessToken}',
        }
    })

    });
  }
}
