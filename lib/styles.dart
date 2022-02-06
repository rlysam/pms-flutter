import 'package:division/division.dart';
import 'package:flutter/material.dart';

//Main Colors
Color kYellow = const Color(0xffFFD659);
Color kBlue = const Color(0xff0D7BCC);
Color kRed = const Color(0xffF05B5B);
Color kGreen = const Color(0xff379E75);
Color kBlack = const Color.fromARGB(255, 19, 17, 17);
Color kGray = const Color(0xffD6D1D1);
Color kContainerBG = const Color.fromARGB(255, 232, 233, 233);
Color kWhite = const Color(0xffF4F4FF);

// example for containers/ same with "div"
final styleLoginDiv = ParentStyle()
  ..background.color(kContainerBG)
  ..alignment.center()
  ..alignmentContent.center()
  ..width(500)
  ..maxHeight(400)
  ..borderRadius(all: 15)
  ..border(all: 1, color: kGray);


// example for containers/ same with "div"
final styleButtonBlue = ParentStyle()
  ..background.color(kBlue)
  ..width(300)
  ..height(50)
  ..borderRadius(all: 15)
  ..border();



// example for containers/ same with "div"
final styleGeneralContainer = ParentStyle()
  ..background.color(kContainerBG)
  ..alignment.center()
  ..width(319)
  ..border(right: 1, color: kGray);

// example for Texts
final styleLogoFont = TxtStyle()
  ..fontSize(44 / 1.2)
  ..padding(bottom: 16)
  ..bold()
  ..letterSpacing(1.8)
  ..textColor(kBlack);

// example for Texts
final styleHeaderText = TxtStyle()
  ..fontSize(24 / 1.2)
  ..padding(bottom: 16)
  ..bold()
  ..letterSpacing(1.8)
  ..textColor(kBlack);

// example for Texts
final styleHeader2Text = TxtStyle()
  ..fontSize(18 / 1.2)
  ..padding(bottom: 16)
..textElevation(1)
  ..alignment.bottomCenter()
//   ..alignmentContent.center()
  ..bold()
  ..letterSpacing(1.8)
  ..textColor(kBlack);