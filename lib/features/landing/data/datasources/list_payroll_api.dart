
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

    print('\n\nResponse body');
    print(response.body);

    var forDecryption = json.decode(response.body); //{secureddata: value}

    print('\n\nResponse decode');
    print(forDecryption);

    forDecryption.forEach((key, value){
    // print('Value: ${value.runtimeType}');

    var decrypt2 = decrypt(value); //string of JSOk

    var val = PayrollAll.fromJson(decrypt2);
    allRecord.add(val);
    // print('------------------------------');
    });

    // String decrypted = decrypt(response.body); //"{key:value}"
    // print(decrypted);
    // ! PAG JSON DECODE ang output === MAP
    // * Nag e-expect ako na LIST yung json paglabas

    // ! PAG JSON DECODE ang output === MAP


    // TODO RETURN LIST OF PayrollAll

    // return PayrollAll.fromJson(decrypted); //JSON File yung andito
    return allRecord;
  } else if (response.statusCode == 404) {
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 401) {
    throw Exception('Failed to login user: Wrong password.');
  } else {
    throw Exception('Failed to login user.');
  }
}
