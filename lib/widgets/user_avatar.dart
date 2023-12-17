import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, this.withBorder = false});

  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          side: withBorder
              ? BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 5)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          "https://lh3.googleusercontent.com/a/ACg8ocKCpMj3IEKixvQeFm9mbioqATHN1koi6xkw75Fm7lXAYw=s96-c",
          fit: BoxFit.fill,
        ),
      ),
    ]);
  }
}
