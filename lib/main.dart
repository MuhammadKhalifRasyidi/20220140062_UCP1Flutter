import 'package:flutter/material.dart';
import 'package:ucp1flutter/login_page.dart';
import 'package:ucp1flutter/home_page.dart';
import 'package:ucp1flutter/data_piket.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        // '/order': (context) => const OrderPage(),
      }
    );
  }
}
