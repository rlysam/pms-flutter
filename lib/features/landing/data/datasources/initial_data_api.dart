import 'package:http/http.dart' as http;
import 'package:payrollsystem/features/landing/data/datasources/security.dart';
import 'package:payrollsystem/features/landing/data/models/initial_data.dart';
import 'dart:convert';

import 'package:payrollsystem/features/landing/data/models/initial_send.dart';
import 'package:payrollsystem/features/landing/data/models/payroll_all.dart';

Future <PayrollAll> sendInitialData(InitialSend data) async {
  var jsonEncode2 = data.toJson();
  String securedDataBase64 = encrypt(jsonEncode2);
  final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/receiveInitialData'),
      body: securedDataBase64,
    //   headers: {'Content-type': 'application/json'}
      );

  if (response.statusCode == 200) {
    // var forDecryption = json.decode(response.body); //{secureddata: value}
    String decrypted = decrypt(response.body); //"{key:value}"

    return PayrollAll.fromJson(decrypted); //JSON File yung andito
  } else if (response.statusCode == 404) {
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 401) {
    throw Exception('Failed to login user: Wrong password.');
  } else {
    throw Exception('Failed to login user.');
  }
}
