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

    String tugasPertama = tugasList.isNotEmpty ? tugasList[0].split(' - ').first : 'Tugas Tidak Ditemukan';

    return Scaffold(
      backgroundColor: Color(0xFFFEF6F4),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Detail $tugasPertama', // Menambahkan judul berdasarkan tugas
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    formattedDate,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
                Card(
                  color: Colors.greenAccent.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Text(
                      nama,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Daftar tugas dalam Card
            Expanded(
              child: tugasList.isEmpty
                  ? Center(child: Text("Tidak ada tugas"))
                  : ListView.builder(
                      itemCount: tugasList.length,
                      itemBuilder: (context, index) {
                        final tugas = tugasList[index].split(' - ').first;
                        return SizedBox(
                          height: 65,
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tugas,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify, // Justify the text
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
