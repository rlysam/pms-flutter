import 'package:flutter/material.dart';
import 'package:payrollsystem/features/landing/presentation/pages/landing_page.dart';
import 'package:payrollsystem/features/login_page/presentation/pages/login_page.dart';
import 'package:provider/provider.dart';

import 'authentication_service.dart';
import 'features/login_page/data/models/user.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? LoginScreen() : LandingPage();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}