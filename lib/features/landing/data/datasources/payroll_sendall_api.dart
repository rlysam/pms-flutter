import 'package:http/http.dart' as http;
import 'package:payrollsystem/features/landing/data/datasources/security.dart';
import 'dart:convert';
import 'package:payrollsystem/features/landing/data/models/payroll_all.dart';

sendPayrollAll(PayrollAll data) async {
  var jsonEncode2 = jsonEncode(data);
  String securedDataBase64 = encrypt(jsonEncode2.toString());
  final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/receiveAllData'),
      body: {"secured_data": securedDataBase64},
      headers: {'Content-type': 'application/json'});
}
