import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormAlatPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const FormAlatPage({super.key, required this.onSubmit});

  @override
  _FormAlatPageState createState() => _FormAlatPageState();
}

class _FormAlatPageState extends State<FormAlatPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaAlatController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  String _kondisi = 'Baik';
  bool _tersedia = true;

  Future<void> _submitData() async {
    final response = await http.post(
      Uri.parse('http://172.20.10.5/API_SIMLAB/Alat/formulir_alat.php'),
      body: {
        'nama_alat': _namaAlatController.text,
        'jumlah': _jumlahController.text,
        'kondisi': _kondisi,
        'status': _tersedia ? 'available' : 'not available',
      },
    );

    if (response.statusCode == 200) {
      final newAlat = {
        'title': _namaAlatController.text,
        'image': 'path/to/image.jpg', // Replace with actual image path
        'status': _tersedia ? 'available' : 'not available',
        'jumlah': _jumlahController.text,
        'kondisi': _kondisi,
      };
      widget.onSubmit(newAlat);
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
        title: const Text('Formulir Alat'),
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
                  'Gambar Alat',
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
                    child: const Icon(
                      Icons.upload,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _namaAlatController,
                  decoration: const InputDecoration(
                    labelText: 'Nama alat',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama alat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _jumlahController,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jumlah tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Kondisi Alat',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Baik'),
                        value: 'Baik',
                        groupValue: _kondisi,
                        onChanged: (value) {
                          setState(() {
                            _kondisi = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Cukup'),
                        value: 'Cukup',
                        groupValue: _kondisi,
                        onChanged: (value) {
                          setState(() {
                            _kondisi = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Status',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  title: const Text('Tidak Tersedia / Tersedia'),
                  value: _tersedia,
                  onChanged: (value) {
                    setState(() {
                      _tersedia = value;
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
