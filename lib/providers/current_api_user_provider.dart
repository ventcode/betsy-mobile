import 'dart:convert';
import 'dart:io';

import 'package:betsy_mobile/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'current_user_provider.dart';

part 'current_api_user_provider.g.dart';

@riverpod
Future<User> currentAPIUser(CurrentAPIUserRef ref) async {
  final uri = Uri.parse('http://10.0.2.2:8080/user');
  final auth = ref.watch(asyncCurrentUserProvider);
  final authCode = await auth.value?.authentication;

  final http.Response response = await http.get(uri, headers: {
    HttpHeaders.authorizationHeader: '${authCode?.accessToken}',
  });

  final body = jsonDecode(response.body);

  return User.fromJson(body);
}
