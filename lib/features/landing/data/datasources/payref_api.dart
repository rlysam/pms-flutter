import 'package:http/http.dart' as http;
import 'package:payrollsystem/features/landing/data/datasources/security.dart';
import 'package:payrollsystem/features/landing/data/models/payref.dart';
import 'dart:convert';

Future<PayRefData> getPayref() async {

  final response = await http.post(Uri.parse('http://127.0.0.1:5000/sendPayRef'));

  if (response.statusCode == 200) {
    //   print(json.decode(response.body));
    //   print(response.body);
    var forDecryption = json.decode(response.body); //{secureddata: value}
    String decrypted = decrypt(forDecryption); //"{key:value}"

    return PayRefData.fromJson(json.decode(decrypted)); //JSON File yung andito
    // return PayRefData.fromJson(decrypt(json.decode(response.body)['securedData']));
  } else if (response.statusCode == 404) {
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 401) {
    throw Exception('Failed to login user: Wrong password.');
  } else {
    throw Exception('Failed to login user.');
  }
}
