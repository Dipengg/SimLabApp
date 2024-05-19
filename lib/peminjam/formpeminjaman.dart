import 'package:flutter/material.dart';

class FormPeminjamanPage extends StatefulWidget {
  const FormPeminjamanPage({super.key});

  @override
  _FormPeminjamanPageState createState() => _FormPeminjamanPageState();
}

class _FormPeminjamanPageState extends State<FormPeminjamanPage> {
  bool _isRuanganSelected = false;
  bool _isAlatSelected = false;
  DateTime? _tanggalPeminjaman;
  DateTime? _tanggalPengembalian;

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
              _buildKategoriField(),
              _buildTextField('Detail Peminjaman', 'Masukkan Alat / Ruangan'),
              _buildDateField('Tanggal Peminjaman', _tanggalPeminjaman, (selectedDate) {
                setState(() {
                  _tanggalPeminjaman = selectedDate;
                });
              }),
              _buildDateField('Tanggal Pengembalian', _tanggalPengembalian, (selectedDate) {
                setState(() {
                  _tanggalPengembalian = selectedDate;
                });
              }),
              _buildTextField('Keperluan', 'Masukkan keterangan keperluan'),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // handle form submission
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

  Widget _buildKategoriField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kategori',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CheckboxListTile(
            title: const Text('Ruangan'),
            value: _isRuanganSelected,
            onChanged: (bool? value) {
              setState(() {
                _isRuanganSelected = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Alat'),
            value: _isAlatSelected,
            onChanged: (bool? value) {
              setState(() {
                _isAlatSelected = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? selectedDate, ValueChanged<DateTime?> onDateSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                onDateSelected(pickedDate);
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                hintText: selectedDate == null
                    ? 'Masukkan tanggal'
                    : '${selectedDate!.day}/${selectedDate.month}/${selectedDate.year}',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                selectedDate == null
                    ? 'Masukkan tanggal'
                    : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
