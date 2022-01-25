// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:division/division.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.inputController,
  }) : super(key: key);

  final TextEditingController inputController;
  final String label;
//   final VoidCallback onPressed;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    widget.inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Txt(widget.label, style: labelFont),
          const SizedBox(width: 10),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200),
            child: TextFormField(
              controller: widget.inputController,
              onChanged: (value) => print(value),
              decoration: CommonStyleInput.textFieldStyle(
                labelTextStr: widget.label,
                hintTextStr: widget.label,
              ),
            ),
          )
        ],
      ),
    );
  }
}

final labelFont = TxtStyle()
  ..fontSize(18)
  ..letterSpacing(1.2)
  ..bold()
  ..textOverflow(TextOverflow.ellipsis)
  ..textColor(Colors.black);

class CommonStyleInput {
  static InputDecoration textFieldStyle({
    String labelTextStr = "",
    String hintTextStr = "",
    bool isPager = true,
    bool isCorrect = true,
    bool hasIcon = false,
    IconData myIcon = Icons.visibility_outlined,
  }) {
    OutlineInputBorder outlineRed() {
      return OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(10));
    }

    OutlineInputBorder outline() {
      return OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10));
    }

    return InputDecoration(
        contentPadding: isPager
            ? const EdgeInsets.only(left: 25)
            : const EdgeInsets.fromLTRB(15, 5, 11, 5),
        labelText: labelTextStr,
        hintText: hintTextStr,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: (isCorrect ? outline() : outlineRed()),
        focusedBorder: (isCorrect ? outline() : outlineRed()),
        disabledBorder: (isCorrect ? outline() : outlineRed()),
        border: (isCorrect ? outline() : outlineRed()));
  }
}
