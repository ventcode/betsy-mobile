import 'package:betsy_mobile/models/user.dart';
import 'package:betsy_mobile/providers/current_api_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSmall extends ConsumerWidget {
  const UserSmall({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAPIUser = ref.watch(currentAPIUserProvider);
    final isCurrentUser = currentAPIUser.requireValue.id == user.id;
    return Text(
      isCurrentUser ? "You" : user.id.toString(),
      style: const TextStyle(fontSize: 42, overflow: TextOverflow.ellipsis),
    );
  }
}
