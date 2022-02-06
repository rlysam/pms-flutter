import 'package:encrypt/encrypt.dart' as security;
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:payrollsystem/features/landing/data/datasources/initial_data_api.dart';
import 'package:payrollsystem/features/landing/data/datasources/payref_api.dart';
import 'package:payrollsystem/features/landing/data/datasources/payroll_sendall_api.dart';
import 'package:payrollsystem/features/landing/data/models/initial_data.dart';
import 'package:payrollsystem/features/landing/data/models/initial_send.dart';
import 'package:payrollsystem/features/landing/data/models/payref.dart';
import 'package:payrollsystem/features/landing/data/models/payroll_all.dart';
import 'package:payrollsystem/features/landing/presentation/widgets/customButton.dart';
import 'package:payrollsystem/features/landing/presentation/widgets/customfield.dart';
import 'package:payrollsystem/styles.dart';

// import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> firstBlock = [
      'Employee Name',
      'Address',
      'Reference',
      'Employer Name',
      'Email',
      'Job Status',
    ];

    List<String> secondBlock = [
      'De Minimis',
      'Basic Salary',
      'Overtime',
      'Gross Pay',
      'Net Pay',
    ];

    List<String> thirdBlock = [
      'Tax',
      'SSS',
      'Loan',
      'PhilHealth Payment',
      'HDMF(PAGIBIG)',
      'Deductions',
    ];

    List<String> fourthBlock = [
      'Post Code',
      'Gender',
      'Grade',
      'Department',
    ];

    List<String> fifthBlock = [
      'Pay Date d/m/y',
      'Philhealth Number',
      'Taxable Pay',
      'SSS Pay',
      'Other Payment Due',
    ];

    List<TextEditingController> _field1 =
        List.generate(6, (i) => TextEditingController());
    List<TextEditingController> _field2 =
        List.generate(5, (i) => TextEditingController());
    List<TextEditingController> _field3 =
        List.generate(6, (i) => TextEditingController());
    List<TextEditingController> _field4 =
        List.generate(4, (i) => TextEditingController());
    List<TextEditingController> _field5 =
        List.generate(7, (i) => TextEditingController());

    List<VoidCallback> functions = [
      () {
        bool empty = false;

// TODO CALL initial_data_API

        var text2 = _field2[0].text; //DM
        var text3 = _field2[1].text; //BS
        var text4 = _field2[2].text; //OT
        var text5 = _field3[2].text; //LOAN

        text2.isEmpty ? empty = true : null;
        text3.isEmpty ? empty = true : null;
        text4.isEmpty ? empty = true : null;
        text5.isEmpty ? empty = true : null;

        empty
            ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Fill all the fields",
                    style: TextStyle(color: Colors.red)),
              ))
            : null;

        if (!empty) {
          InitialSend theInitialData = InitialSend(
              basic_salary: text3,
              deminimis: text2,
              overtime: text4,
              loan: text5);
          sendInitialData(theInitialData).then((initialData) {
            _field2[3].text = initialData.gross_pay;
            _field2[4].text = initialData.net_pay;

            _field3[0].text = initialData.tax;
            _field3[1].text = initialData.sss;
            _field3[3].text = initialData.philhealth_payment;
            _field3[4].text = initialData.hdmf;
            _field3[5].text = initialData.deductions;

            _field5[2].text = initialData.taxable_pay;
            _field5[3].text = initialData.pension_pay;
            _field5[4].text = initialData.other_payment_due;

            //   send email

            //   TODO Check All fields
            // kapag walang empty, send
            for (var x in _field1) {
              x.text == "" ? empty = true : null;
            }
            for (var x in _field2) {
              x.text == "" ? empty = true : null;
            }
            for (var x in _field3) {
              x.text == "" ? empty = true : null;
            }
            for (var x in _field4) {
              x.text == "" ? empty = true : null;
            }
            for (var x in _field5) {
              x.text == "" ? empty = true : null;
            }

            if (_field1[4].text.isNotEmpty) {
              initialData.employee_name = _field1[0].text;
              initialData.address = _field1[1].text;
              initialData.employer_name = _field1[3].text;
              initialData.email = _field1[4].text;
              initialData.job_status = _field1[5].text;

              initialData.postcode = _field4[0].text;
              initialData.gender = _field4[1].text;
              initialData.grade = _field4[2].text;
              initialData.department = _field4[3].text;

              initialData.deminimis = _field2[0].text;
              initialData.basic_salary = _field2[1].text;
              initialData.overtime = _field2[2].text;
              initialData.loan = _field3[2].text;
              
              
             initialData.pay_date =_field5[0].text;
             initialData.philhealth_number =_field5[1].text;
             initialData.reference =_field1[2].text;

              sendPayrollAll(initialData);
            }
          });
        }
        // empty = false;
      }, // main functionality = send all data to backend
      () {
        for (var x in _field1) {
          x.text = "";
        }
        for (var x in _field2) {
          x.text = "";
        }
        for (var x in _field3) {
          x.text = "";
        }
        for (var x in _field4) {
          x.text = "";
        }
        for (var x in _field5) {
          x.text = "";
        }
      }, // Reset all fields
      () {
        getPayref().then((value) {
          _field5[0].text = value.pay_date;
          _field5[1].text = value.philhealth_number;
          _field1[2].text = value.reference;
        });
      }, // READ PayRef from backend (PMS.py)
      () {}, // view reports ALL Transactions - yung need ng 2 admin auth
      () {

      }, //exit close program
    ];

    List<String> btnLabels = [
      'Wage Payment',
      'Reset System', //reset Fields
      'Pay Reference', //get from PMS.py
      'View Reports', //kalokohan ni lyah na report
      'Logout',
    ];

    Size size = MediaQuery.of(context).size;

    var sectionsWidth = 440.0;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt('SVG. CO.EY/COMPANY', style: styleLogoFont),
                


              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    color: const Color.fromARGB(255, 255, 239, 192),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //first block
                        Column(
                          children: [
                            Container(
                              color: const Color.fromARGB(255, 214, 255, 81),
                              width: sectionsWidth,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: firstBlock.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedWidget(
                                      isWide: true,
                                      widget: CustomTextField(
                                          inputController: _field1[index],
                                          label: firstBlock[index]));
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //secondblock
                            Container(
                              color: const Color.fromARGB(255, 152, 255, 250),
                              width: sectionsWidth,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: secondBlock.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedWidget(
                                      widget: CustomTextField(
                                          inputController: _field2[index],
                                          label: secondBlock[index]));
                                },
                              ),
                            ),
                            //thirdblock
                            Container(
                              color: const Color.fromARGB(255, 255, 152, 224),
                              width: sectionsWidth,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: thirdBlock.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedWidget(
                                      widget: CustomTextField(
                                          inputController: _field3[index],
                                          label: thirdBlock[index]));
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    color: const Color.fromARGB(255, 199, 240, 236),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //fourth block
                        Container(
                          color: const Color.fromARGB(255, 109, 255, 141),
                          width: sectionsWidth,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: fourthBlock.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedWidget(
                                  isWide: true,
                                  widget: CustomTextField(
                                      inputController: _field4[index],
                                      label: fourthBlock[index]));
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //fiftch block
                            Container(
                              color: const Color.fromARGB(255, 255, 234, 173),
                              width: sectionsWidth,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: fifthBlock.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedWidget(
                                      widget: CustomTextField(
                                          inputController: _field5[index],
                                          label: fifthBlock[index]));
                                },
                              ),
                            ),
                            const SizedBox(width: 30),
                            //thirdblock
                            SizedBox(
                              width: 200,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: btnLabels.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomButtom(
                                      onPressed: functions[index],
                                      label: btnLabels[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SizedWidget extends StatelessWidget {
  SizedWidget({
    Key? key,
    required this.widget,
    this.isWide = false,
  }) : super(key: key);

  bool isWide;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: isWide ? 600 : 300, child: widget);
  }
}
