// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:async';

/// The type of the onClick callback for the (mobile) Sign In Button.
typedef HandleSignInFn = Future<void> Function();

/// Renders a SIGN IN button that calls `handleSignIn` onclick.
Widget buildSignInButton({HandleSignInFn? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    // TODO: Move these styles into theme
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50), // NEW
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor: const Color(0xff162956),
    ),
    child: const Text(
      'SIGN IN',
      style: TextStyle(color: Colors.white),
    ),
  );
}
