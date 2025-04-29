import 'package:flutter/material.dart';
import 'package:ucp1flutter/data_piket.dart';
import 'package:ucp1flutter/data_pelanggan.dart';
import 'package:ucp1flutter/barang_masuk_keluar.dart';
import 'package:ucp1flutter/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.greenAccent,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/kambing.png'),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        key: _formKey,
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
           
          ],
        ),
      ),
    );
  }
}
