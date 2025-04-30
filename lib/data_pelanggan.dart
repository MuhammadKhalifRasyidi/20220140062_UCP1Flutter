import 'package:flutter/material.dart';
import 'package:ucp1flutter/detail_pelanggan.dart';

class DataPelanggan extends StatefulWidget {
  const DataPelanggan({super.key});

  @override
  State<DataPelanggan> createState() => _DataPelangganState();
}

class _DataPelangganState extends State<DataPelanggan> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaCustController = TextEditingController();
  final TextEditingController emailCustController = TextEditingController();
  final TextEditingController noHpCustController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Data Pelanggan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: Text('Nama Cust')),
              const SizedBox(height: 10),
              TextFormField(
                controller: namaCustController,
                decoration: const InputDecoration(
                  labelText: 'Nama Cust',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Cust tidak boleh kosong';
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
