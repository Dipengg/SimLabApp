import 'package:flutter/material.dart';

class FormulirRuanganPage extends StatelessWidget {
  const FormulirRuanganPage({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUploadImageField(),
              const SizedBox(height: 16),
              _buildTextField('Nama Ruangan', 'Masukkan nama alat disini'),
              const SizedBox(height: 16),
              _buildTextField('Lokasi Ruangan', 'Masukkan lokasi ruangan'),
              const SizedBox(height: 16),
              _buildTextField('Kapasitas', 'Masukkan kapasitas ruangan'),
              const SizedBox(height: 16),
              const Text(
                'Kondisi Alat',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildRadioButtonGroup(),
              const SizedBox(height: 16),
              const Text(
                'Status',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildStatusSwitch(),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadImageField() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Gambar Ruangan',
        hintText: 'Upload gambar disini',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.file_upload),
          onPressed: () {
 
          },
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildRadioButtonGroup() {
    return Column(
      children: [
        ListTile(
          title: const Text('Baik'),
          leading: Radio(
            value: 'Baik',
            groupValue: 'Kondisi Alat',
            onChanged: (value) {

            },
          ),
        ),
        ListTile(
          title: const Text('Cukup'),
          leading: Radio(
            value: 'Cukup',
            groupValue: 'Kondisi Alat',
            onChanged: (value) {

            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatusSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Tidak Tersedia / Tersedia'),
        Switch(
          value: false,
          onChanged: (value) {

          },
        ),
      ],
    );
  }
}