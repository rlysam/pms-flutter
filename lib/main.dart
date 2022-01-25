import 'package:flutter/material.dart';
import 'package:payrollsystem/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payroll MS InfoSec',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),      
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
