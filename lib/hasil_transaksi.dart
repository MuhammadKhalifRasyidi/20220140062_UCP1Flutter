import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1flutter/home_page.dart';

class HasilTransaksi extends StatefulWidget {
  final Map<String, String> transaksi;

  const HasilTransaksi({super.key, required this.transaksi});

  @override
  State<HasilTransaksi> createState() => _HasilTransaksiState();
}

class _HasilTransaksiState extends State<HasilTransaksi> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Icon(Icons.check_circle, color: Colors.green, size: 100),
              const Text(
                'Data Berhasil Disimpan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
             
            
            ],
          ),
        ),
      ),
    );
  }

  
}
