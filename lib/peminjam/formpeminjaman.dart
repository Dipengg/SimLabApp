// peminjaman_form.dart
import 'package:flutter/material.dart';

class FormPeminjamanPage extends StatelessWidget {
  const FormPeminjamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Peminjaman'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Nama', 'Masukkan nama lengkap anda'),
              _buildTextField('NIM', 'Masukkan NIM anda'),
              _buildTextField('Kategori', 'Contoh: Alat / Ruangan / Alat & Ruangan'),
              _buildTextField('Detail Peminjaman', 'Masukkan daftar Alat / Ruangan'),
              _buildTextField('Tanggal Peminjaman', 'Masukkan tanggal peminjaman'),
              _buildTextField('Tanggal Pengembalian', 'Masukkan tanggal pengembalian'),
              _buildTextField('Keperluan', 'Masukkan keterangan keperluan'),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your submit logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: const Text('Kirim', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
