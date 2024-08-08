import 'package:flutter/material.dart';

class Conditional extends StatelessWidget {
  Conditional({
    super.key,
    required this.condition,
    required this.then,
    required this.otherwise
  });

  bool condition;
  final Widget then;
  final Widget otherwise;

  @override
  Widget build(BuildContext context) {
    return condition ? then: otherwise;
  }
}
