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

    DateTime? parsedDate;
    if (tanggalTugas != null) {
      final split = tanggalTugas.split('-');
      if (split.length == 3) {
        parsedDate = DateTime(
          int.parse(split[2]),
          int.parse(split[1]),
          int.parse(split[0]),
        );
      }
    }

    String formattedDate =
        parsedDate != null
            ? DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(parsedDate)
            : 'Tanggal tidak tersedia';

    // Ambil tugas pertama sebagai judul
    String tugasPertama = tugasList.isNotEmpty ? tugasList[0].split(' - ').first : 'Tugas Tidak Ditemukan';

    return Scaffold(
      
    );
  }
}
