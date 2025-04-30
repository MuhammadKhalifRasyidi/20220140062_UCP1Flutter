import 'package:flutter/material.dart';
import 'package:ucp1flutter/home_page.dart';

class DetailPelanggan extends StatefulWidget {
  const DetailPelanggan({super.key});

  @override
  State<DetailPelanggan> createState() => _DetailPelangganState();
}

class _DetailPelangganState extends State<DetailPelanggan> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Detail ', // $tugasPertama Menambahkan judul berdasarkan tugas
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/images/kambing.png', height: 120),
                Text('SELAMAT DATANG KEMBALI'),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
