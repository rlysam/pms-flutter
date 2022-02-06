import 'package:division/division.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  ReportsPage({Key? key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Txt('REPorts'),));
  }
}