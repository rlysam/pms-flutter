
import 'package:http/http.dart' as http;
import 'package:payrollsystem/features/landing/data/datasources/security.dart';
import 'package:payrollsystem/features/landing/data/models/initial_data.dart';
import 'dart:convert';

import 'package:payrollsystem/features/landing/data/models/initial_send.dart';
import 'package:payrollsystem/features/landing/data/models/payroll_all.dart';

Future <List<PayrollAll>> getAllTransactions() async {


//   var jsonEncode2 = data.toJson();
//   String securedDataBase64 = encrypt(jsonEncode2);

  final response = await http.post(Uri.parse('http://127.0.0.1:5000/getAllRecords'));

  if (response.statusCode == 200) {
    List<PayrollAll> allRecord = [];

    var forDecryption = json.decode(response.body); //{secureddata: value}

    print(forDecryption.runtimeType);
    print(forDecryption);
    print(response.body);

    forDecryption.forEach((key, value){
    // print('Key: $key');
    // print('Value: ${value.runtimeType}');
    var decrypt2 = decrypt(value);
    print(decrypt2.runtimeType);
    var sam = jsonDecode(decrypt2);
    print(sam);
    print(sam.runtimeType);
    // allRecord.add(PayrollAll.fromMap(decrypt2));
    print('------------------------------');
    });

    // String decrypted = decrypt(response.body); //"{key:value}"
    // print(decrypted);
    // ! PAG JSON DECODE ang output === MAP
    // * Nag e-expect ako na LIST yung json paglabas

    // ! PAG JSON DECODE ang output === MAP


    // TODO RETURN LIST OF PayrollAll

    // return PayrollAll.fromJson(decrypted); //JSON File yung andito
    return [];
  } else if (response.statusCode == 404) {
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 401) {
    throw Exception('Failed to login user: Wrong password.');
  } else {
    throw Exception('Failed to login user.');
  }
}
