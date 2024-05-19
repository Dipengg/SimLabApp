import 'package:flutter/material.dart';

class FormPeminjamanPage extends StatefulWidget {
  const FormPeminjamanPage({super.key});

  @override
  State<FormPeminjamanPage> createState() => _FormPeminjamanPageState();
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ValidationDialog(
                          onConfirm: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  title: 'Data Terkirim',
                                  content: 'Data peminjaman anda telah berhasil dikirim.',
                                  confirmText: 'OK',
                                  onConfirm: () {
                                    Navigator.of(context).popUntil((route) => route.isFirst);
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    );
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
                    : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
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

class ValidationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ValidationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          Icon(Icons.warning, color: Colors.yellow[700]),
          const SizedBox(width: 10),
          const Text('Validasi'),
        ],
      ),
      content: const Text('Apakah anda yakin dengan data yang anda masukkan?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Tidak', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text('Yakin'),
        ),
      ],
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback onConfirm;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.green),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
      content: Text(content),
      actions: <Widget>[
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text(confirmText),
        ),
      ],
    );
  }
}
