import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormulirRuanganPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const FormulirRuanganPage({super.key, required this.onSubmit});

  @override
  _FormulirRuanganPageState createState() => _FormulirRuanganPageState();
}

class _FormulirRuanganPageState extends State<FormulirRuanganPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaRuanganController = TextEditingController();
  final TextEditingController _kapasitasController = TextEditingController();
  String _status = 'Available';

  Future<void> _submitData() async {
    final response = await http.post(
      Uri.parse('http://172.20.10.5/API_SIMLAB/Ruangan/formulir_ruangan.php'),
      body: {
        'nama_ruangan': _namaRuanganController.text,
        'kapasitas': _kapasitasController.text,
        'status': _status,
      },
    );

    if (response.statusCode == 200) {
      final newRuangan = {
        'title': _namaRuanganController.text,
        'image': 'path/to/image.jpg', // Replace with actual image path
        'status': _status,
        'kapasitas': _kapasitasController.text,
      };
      widget.onSubmit(newRuangan);
      Navigator.of(context).pop();
    } else {
      // Handle error
      print('Failed to submit data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Ruangan'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gambar Ruangan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // Handle image upload
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Icon(                      Icons.upload,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _namaRuanganController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Ruangan',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama ruangan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _kapasitasController,
                  decoration: const InputDecoration(
                    labelText: 'Kapasitas',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kapasitas tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Status',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _status,
                  items: <String>['Available', 'Not Available'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _status = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitData();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Tambah'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

                     
