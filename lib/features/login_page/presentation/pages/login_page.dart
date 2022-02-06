import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:payrollsystem/authentication_service.dart';
import 'package:payrollsystem/styles.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _Username = TextEditingController();
  final TextEditingController _Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Parent(
          style: styleLoginDiv,
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 20),
                Txt(
                  'ADMIN Login'.toUpperCase(),
                  style: styleHeaderText,
                ),
                Txt(
                  'user authentication'.toUpperCase(),
                  style: styleHeader2Text,
                ),
                Column(
                  children: [
                    SizedBox(height: 50),
                    CustomTextField(
                        label: 'Username', inputController: _Username),
                    CustomTextField(
                        isPassword: true,
                        label: 'Password',
                        inputController: _Password),
                    SizedBox(height: 50),
                  ],
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      context.read<AuthenticationService>().signIn(
                            email: _Username.text.toString().trim(),
                            password: _Password.text.toString().trim(),
                          );
                    },
                    child: Parent(
                      style: styleButtonBlue
                        ..clone()
                        ..background.color(kYellow),
                      child: Container(
                        child: Txt(
                          'LOGIN',
                          style: styleHeader2Text,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.label,
      required this.inputController,
      this.isPassword = false})
      : super(key: key);

  final TextEditingController inputController;
  final String label;
  final bool isPassword;
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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 350),
            child: TextFormField(
              controller: widget.inputController,
              onChanged: (value) => print(value),
              decoration: CommonStyleInput.textFieldStyle(
                labelTextStr: widget.label,
                hintTextStr: widget.label,
              ),
              obscureText: widget.isPassword,
              enableSuggestions: !widget.isPassword,
              autocorrect: !widget.isPassword,
            ),
          )
        ],
      ),
    );
  }
}

// ! Layout Styles

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
