import 'package:http/http.dart' as http;
import 'package:payrollsystem/features/landing/data/datasources/security.dart';
import 'dart:convert';
import 'package:payrollsystem/features/landing/data/models/payroll_all.dart';

sendPayrollAll(PayrollAll data) async {
  var jsonEncode2 = data.toJson();
  String securedDataBase64 = encrypt(jsonEncode2);
  final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/receiveAllData'),
      body: securedDataBase64,
      );
}
