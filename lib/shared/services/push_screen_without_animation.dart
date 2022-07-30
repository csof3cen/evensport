import 'package:flutter/material.dart';

pushScreenWithoutAnimation(BuildContext context, {required Widget target}) {
  return Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => target,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
  );
}
