import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1flutter/hasil_transaksi.dart';

void main() {
  runApp(const MaterialApp(home: Barang()));
}

class Barang extends StatefulWidget {
  const Barang({super.key});

  @override
  State<Barang> createState() => _BarangState();
}

class _BarangState extends State<Barang> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jenisTransaksiController = TextEditingController();
  final TextEditingController jenisBarangController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController hargaSatuanController = TextEditingController();

  DateTime? selectedDate;

  final Map<String, String> hargaSatuanPerBarang = {
    'Jagung': '20000',
    'Vitamin': '150000',
    'Booster': '500000',
    'Kedelai': '30000',
  };

  void _pilihTanggal() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
        tanggalController.text = '${date.day}-${date.month}-${date.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'Pendataan Barang',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Pilih Tanggal"),
              const SizedBox(height: 10),
              TextFormField(
                controller: tanggalController,
                readOnly: true,
                onTap: _pilihTanggal,
                decoration: const InputDecoration(
                  hintText: 'Pilih Tanggal',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: jenisTransaksiController.text.isEmpty ? null : jenisTransaksiController.text,
                decoration: const InputDecoration(
                  labelText: 'Jenis Transaksi',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.swap_horiz),
                ),
                items: ['Barang Masuk', 'Barang Keluar'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    jenisTransaksiController.text = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis Transaksi tidak boleh kosong';
                  }
                  return null;
                },
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
