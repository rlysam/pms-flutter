import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:payrollsystem/features/landing/presentation/widgets/customButton.dart';
import 'package:payrollsystem/features/landing/presentation/widgets/customfield.dart';

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
      'Tax Period',
      'Philhealth Number',
      'Philhealth Code',
      'Taxable Pay',
      'Pension Pay',
      'Other Payment Due',
    ];

    // TODO : 2D List of TextEditingContr
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

// ignore: todo
// TODO Ito yung importante para ma-call sa API
    List<VoidCallback> functions = [
        // TODO gawin yung send to backend
      () {
        _field1[3].text = 'New Value';
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
      () {}, // READ PayRef
      () {}, // Pay Code
      () {},
    ];

    List<String> btnLabels = [
      'Wage Payment',
      'Reset System',
      'Pay Reference',
      'Pay Code',
      'Exit',
    ];

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(child: Txt('PAYROLL MANAGEMENT SYSTEM', style: labelFont)),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    color: Color.fromARGB(255, 255, 239, 192),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //first block
                        Column(
                          children: [
                            Container(
                              color: const Color.fromARGB(255, 214, 255, 81),
                              width: 405,
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
                              width: 405,
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
                              width: 405,
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
                    color: Color.fromARGB(255, 199, 240, 236),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //fourth block
                        Container(
                          color: const Color.fromARGB(255, 109, 255, 141),
                          width: 405,
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
                              width: 405,
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
