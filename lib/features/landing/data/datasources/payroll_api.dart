import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:payrollsystem/features/landing/data/models/payroll_all.dart';

// Future<PayrollAll> 
sendPayrollAll(PayrollAll data) async {

//   var jsonEncode2 = jsonEncode(data.toMap());
//   print("\n\n"+jsonEncode2+"\n\n");

  var jsonEncode2 = jsonEncode(data);
  print(jsonEncode2.runtimeType);

  final response = await http.post(
    // Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Register/insert_user'),
    //yung function na hahanapin si x user using email and pass
    Uri.parse('http://127.0.0.1:5000/receiveData'),
    body: jsonEncode2,
headers: {'Content-type': 'application/json'}
  );

  if (response.statusCode == 200) {
    // If the server dfirstName return a 201 CREATED response,
    // then parse the JSON.
    // ignore: todo
    // TODO  +=== ito yung kailangan isulat sa API return User.fromJson(json.decode(response.body));
    // return PayrollAll.fromJson(json.decode(response.body));
  } else if (response.statusCode == 404) {
    //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
    // notFound();
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 401) {
    //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
    // wrongPass();
    throw Exception('Failed to login user: Wrong password.');
  } else {
    // If the server dfirstName not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to login user.');
  }
}
