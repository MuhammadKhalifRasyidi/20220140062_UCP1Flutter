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
  DateTime? selectedDate;
  final List<String> daftarTugas = [];

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
