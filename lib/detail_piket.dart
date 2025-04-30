import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPiket extends StatelessWidget {
  final String nama;
  final List<String> tugasList;

  const DetailPiket({Key? key, required this.nama, required this.tugasList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ambil tanggal dari tugas pertama jika ada
    String? tanggalTugas;
    if (tugasList.isNotEmpty) {
      final parts = tugasList[0].split(' - ');
      if (parts.length > 1) tanggalTugas = parts[1];
    }
    return Scaffold(
      
    );
  }
}
