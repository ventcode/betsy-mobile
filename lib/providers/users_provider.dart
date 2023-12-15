import 'dart:convert';

import 'package:betsy_mobile/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_provider.g.dart';

@riverpod
Future<List<User>> users(UsersRef ref) async {
  final uri = Uri.parse('http://10.0.2.2:8080/users');

  final http.Response response = await http.get(uri);

  final body = jsonDecode(response.body);

  return (body as List)
      .map((listElement) => User.fromJson(listElement))
      .toList();
}
