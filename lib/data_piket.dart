import 'package:flutter/material.dart';
import 'package:ucp1flutter/detail_piket.dart';

class DataPiket extends StatefulWidget {
  const DataPiket({Key? key}) : super(key: key);

  @override
  State<DataPiket> createState() => _DataPiketState();
}

class _DataPiketState extends State<DataPiket> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tugasController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  DateTime? selectedDate;
  final List<String> daftarTugas = [];

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

  void _tambahTugas() {
    if (_formKey.currentState!.validate()) {
      if (selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Silakan pilih tanggal terlebih dahulu")),
        );
        return;
      }

      final tugas =
          "${tugasController.text} - ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}";
      setState(() {
        daftarTugas.add(tugas);
        tugasController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF6F4),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Piket Gudang',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama Anggota"),
              const SizedBox(height: 6),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Anggota tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Text("Pilih Tanggal"),
              const SizedBox(height: 6),
              TextFormField(
                controller: tanggalController,
                readOnly: true,
                onTap: _pilihTanggal,
                decoration: InputDecoration(
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
            ],
          ),
        ),
      ),
    );
  }
}
