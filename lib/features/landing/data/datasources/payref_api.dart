import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:payrollsystem/features/landing/data/datasources/security.dart';
import 'package:payrollsystem/features/landing/data/models/payref.dart';

Future<PayRefData> getPayref() async {
  final response = await http.post(Uri.parse('http://127.0.0.1:5000/sendPayRef'));

  if (response.statusCode == 200) {


    String decrypted2 = decrypt(response.body); //"{key:value}"
    var payRefData = PayRefData.fromJson(decrypted2);
    return payRefData; //JSON File yung andito
    // return PayRefData.fromJson(decrypt(json.decode(response.body)['securedData']));

  } else if (response.statusCode == 404) {
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 401) {
    throw Exception('Failed to login user: Wrong password.');
  } else {
    throw Exception('Failed to login user.');
  }
}
