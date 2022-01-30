import 'package:http/http.dart' as http;
import 'package:payrollsystem/features/landing/data/datasources/security.dart';
import 'package:payrollsystem/features/landing/data/models/initial_data.dart';
import 'dart:convert';
import 'package:payrollsystem/features/landing/data/models/payroll_all.dart';

Future <InitialData> sendInitialData(PayrollAll data) async {
  var jsonEncode2 = jsonEncode(data);
  String securedDataBase64 = encrypt(jsonEncode2.toString());
  final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/receiveInitialData'),
      body: {"secured_data": securedDataBase64},
      headers: {'Content-type': 'application/json'});

  if (response.statusCode == 200) {
    var forDecryption = json.decode(response.body); //{secureddata: value}
    String decrypted = decrypt(forDecryption); //"{key:value}"
    return InitialData.fromJson(json.decode(decrypted)); //JSON File yung andito
  } else if (response.statusCode == 404) {
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 401) {
    throw Exception('Failed to login user: Wrong password.');
  } else {
    throw Exception('Failed to login user.');
  }
}
