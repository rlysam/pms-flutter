import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:payrollsystem/styles.dart';

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
    //   child: ElevatedButton(onPressed: onPressed, child: Txt(label)),
      child: MouseRegion(
          cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: onPressed,
          child: Parent(
              style: 
              label=='Logout'? (styleButtonBlue..clone()..background.color(kRed)) :
              label=='Pay Reference'? (styleButtonBlue..clone()..background.color(kGreen)) :
              label=='Reset System'? (styleButtonBlue..clone()..background.color(kRed)) :
                (styleButtonBlue..clone()..background.color(kBlue)),

                    child: Container(child: Txt(label,
                    
style: styleHeader2Text..clone()..textColor(kWhite)


)),)
                ),
      ),
    );
  }
}
