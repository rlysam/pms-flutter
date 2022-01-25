import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
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
      'Ref.',
      'Employer Name',
      'Emila',
      'job status',
    ];

    List<String> secondBlock = [
      'De minimis',
      'Basic Salary',
      'Over time',
      'Gross Pay',
      'Net PAy',
    ];

    List<String> thirdBlock = [
      'Tax',
      'SSS',
      'Loan',
      'PhilHealth Payment',
      'HDmf(PAGIBIG)',
      'Deductions',
    ];

    List<String> fourthBlock = [
      'Post Code',
      'Gender',
      'Grade',
      'DEpartmanet',
    ];

    List<String> fifthBlock = [
      'Pay date d/m/y',
      'Tax perdio',
      'Philhealth number',
      'pihileahl code',
      'Taxable pay',
      'pension pay',
      'other payment due',
    ];

// TODO Ito yung importante para ma-call sa API
    List<VoidCallback> functions = [
      () {},
      () {},
      () {},
      () {},
      () {},
    ];

    List<String> btnLabels = [
      'Wage Payment',
      'Reset System',
      'PAy Refernce',
      'Pay Code',
      'Exit',
    ];

    // ignore: avoid_print
    sam() => print('hello');

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
                                  widget:
                                      CustomTextField(label: fourthBlock[index]));
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