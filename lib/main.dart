import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payrollsystem/authentication_service.dart';
import 'package:payrollsystem/features/landing/presentation/pages/landing_page.dart';
import 'package:payrollsystem/features/login_page/presentation/cubit/login_page_cubit.dart';
import 'package:payrollsystem/features/login_page/presentation/pages/login_page.dart';
import 'package:payrollsystem/route_generator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          Provider<AuthenticationService>(create: (_) => AuthenticationService(FirebaseAuth.instance)),
          StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,),
      ],
      child: MaterialApp(
        title: 'Payroll MS InfoSec',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // initialRoute: '/',
        // initialRoute: LoginScreen(),
        // onGenerateRoute: RouteGenerator.generateRoute,
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      final User? firebaseUser = context.watch<User>();
      if (firebaseUser != null) {
      return const LandingPage();
      }
      return LoginScreen();
  }
}