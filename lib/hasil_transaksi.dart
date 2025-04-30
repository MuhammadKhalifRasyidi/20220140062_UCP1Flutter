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
    String tanggalTransaksi = widget.transaksi['tanggal'] ?? '';
    DateTime? parsedDate;

    if (tanggalTransaksi.isNotEmpty) {
      final split = tanggalTransaksi.split('-');
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
              const SizedBox(height: 50),

              _buildRow('Tanggal', formattedDate),
              const Divider(),

              _buildRow(
                'Jenis Transaksi',
                widget.transaksi['jenisTransaksi'] ?? '-',
              ),
              const Divider(),

              _buildRow('Jenis Barang', widget.transaksi['jenisBarang'] ?? '-'),
              const Divider(),

              _buildRow('Jumlah Barang', widget.transaksi['jumlah'] ?? '-'),
              const Divider(),

              _buildRow('Harga Satuan', widget.transaksi['hargaSatuan'] ?? '-'),
              const Divider(),

              _buildRow('Total Harga', widget.transaksi['totalHarga'] ?? '-'),
              const Divider(),

              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  minimumSize: const Size(900, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
