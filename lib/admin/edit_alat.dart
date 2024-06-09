// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EditAlatPage extends StatelessWidget {
  final Map<String, String> item;
  final Function(Map<String, String>) onDelete;
  final Function(Map<String, String>) onSave;

  const EditAlatPage({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onSave,
    required String alatName,
    required Map<String, String> alat,
  });

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Validasi'),
          content: Text('Apakah anda yakin ingin menghapus data alat ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                onDelete(item);
                Navigator.of(context).pop();
                _showSuccessDialog(context, 'Sukses!', 'Data alat berhasil dihapus!');
              },
              child: Text('Yakin'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Oke'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Alat'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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

                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(item['image'] ?? 'Upload Gambar Disini'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nama alat',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: item['title']),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Jumlah',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: '24'),
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
                      groupValue: 'Baik',
                      onChanged: (value) {

                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Cukup'),
                      value: 'Cukup',
                      groupValue: 'Baik',
                      onChanged: (value) {

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
                value: true,
                onChanged: (value) {

                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showDeleteDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Hapus'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onSave(item);
                      _showSnackbar(context, 'Pemabaruan berhasil disimpan');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
