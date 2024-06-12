import 'package:flutter/material.dart';

class EditRuanganPage extends StatelessWidget {
  final Map<String, dynamic> room;
  final String ruanganName;
  final Function(Map<String, dynamic>) onDelete;
  final Function(Map<String, dynamic>) onSave;

  const EditRuanganPage({
    super.key,
    required this.room,
    required this.ruanganName,
    required this.onDelete,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Ruangan'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Ruangan: $ruanganName'),
            // Add more details and editing fields here
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                onDelete(room);
                Navigator.of(context).pop();
              },
              child: const Text('Hapus'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                onSave(room);
                Navigator.of(context).pop();
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
