// ignore_for_file: prefer_const_constructors

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:payrollsystem/features/landing/data/datasources/list_payroll_api.dart';
import 'package:payrollsystem/features/landing/data/models/payroll_all.dart';
import 'package:payrollsystem/features/landing/presentation/widgets/header.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/rendering.dart';
import 'package:payrollsystem/styles.dart';

class ReportsPage extends StatefulWidget {
  ReportsPage({Key? key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 20),
          CustomHeader(isReport: false),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 300, top: 40),
                child: Txt(
                  'Contributions'.toUpperCase(),
                  style: styleHeaderText,
                ),
              )
            ],
          ),
          SizedBox(width: 700, child: DataTable2SimpleDemo())
        ],
      ),
    );
  }
}

/// Example without a datasource
class DataTable2SimpleDemo extends StatefulWidget {
  const DataTable2SimpleDemo();

  @override
  State<DataTable2SimpleDemo> createState() => _DataTable2SimpleDemoState();
}

class _DataTable2SimpleDemoState extends State<DataTable2SimpleDemo> {
  @override
  Widget build(BuildContext context) {
    int len = 0;
    List<PayrollAll> sam;

    @override
    Future<void> initState() async {
      super.initState();
      sam = List.from(await getAllTransactions());

    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
          shrinkWrap: true,
        children: [
            // Row(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //         ElevatedButton(onPressed: (){

            //         }, child: Txt('Sample'))
            //     ],
            // ),
          DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: [
                DataColumn2(
                  label: Txt('Employee', style: styleDataTitle),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Txt('Address', style: styleDataTitle),
                ),
                DataColumn(
                  label: Txt('Email', style: styleDataTitle),
                ),
                DataColumn(
                  label: Txt('Position', style: styleDataTitle),
                ),
                DataColumn(
                  label: Txt('SSS', style: styleDataTitle),
                  numeric: true,
                ),
                DataColumn(
                  label: Txt('PAGIBIG', style: styleDataTitle),
                  numeric: true,
                ),
                DataColumn(
                  label: Txt('PHILHEALTH', style: styleDataTitle),
                  numeric: true,
                ),
                DataColumn(
                  label: Txt('TAX', style: styleDataTitle),
                  numeric: true,
                ),
              ],
              rows: List<DataRow>.generate( 100,
              (index) => DataRow(cells: [
                    DataCell(Text('A' * (10 - index % 10))),
                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                    DataCell(Text('A' * (10 - index % 10))),
                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                    DataCell(Text('D' * (15 - (index + 10) % 10))),
                    DataCell(Text(((index + 0.1) * 25.4).toString()))
                  ]))),

        ],
      )
    );
  }
}
