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
          'Detail ', 
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.white),
      ),
      
    );
  }
}
