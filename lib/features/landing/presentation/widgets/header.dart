import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:payrollsystem/authentication_service.dart';
import 'package:payrollsystem/styles.dart';
import 'package:provider/provider.dart';

import 'customButton.dart';

class CustomHeader extends StatelessWidget {
    final bool isReport;
  const CustomHeader({Key? key, required this.isReport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    return Parent(
      style: styleHeader,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Txt('SGV & CO./EY COMPANY', style: styleLogoFont),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SizedBox(
                    width: 100,
                  child: CustomButtom(
                    onPressed: () => isReport? Navigator.of(context).pushNamed('/reportPage'): Navigator.of(context).pop(),
                    label: isReport?'REPORTS':'PAYROLL',
                  ),
                ),
                SizedBox(width: 30,),
                SizedBox(
                    width: 100,
                  child: 
                CustomButtom(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/loginPage');
                    authService.signOut();
                  },
                  label: 'Logout'
                ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
