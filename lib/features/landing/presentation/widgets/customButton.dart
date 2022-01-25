import 'package:division/division.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(onPressed: onPressed, child: Txt(label)),
    );
  }
}
