import 'package:flutter/material.dart';

class StripeColor extends StatelessWidget {
  const StripeColor({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 8,
      margin: EdgeInsets.only(left: 5),
      color: color,
      child: Text(''),
    );
  }
}
