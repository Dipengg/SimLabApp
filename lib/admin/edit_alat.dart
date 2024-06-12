import 'package:flutter/material.dart';

class EditAlatPage extends StatelessWidget {
  final Map<String, dynamic> item;
  final String alatName;
  final Function(Map<String, dynamic>) onDelete;
  final Function(Map<String, dynamic>) onSave;

  const EditAlatPage({
    super.key,
    required this.item,
    required this.alatName,
    required this.onDelete,
    required this.onSave,
  });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nama Alat:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(item['title']),
            const SizedBox(height: 10),
            const Text('Jumlah Yang Tersedia:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(item['jumlah'] ?? 'Unknown'),  // Handle null values
            const SizedBox(height: 10),
            const Text('Kondisi:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(item['kondisi'] ?? 'Unknown'),  // Handle null values
            const SizedBox(height: 10),
            const Text('Status:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(item['status'] ?? 'Unknown'),  // Handle null values
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onDelete(item);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Delete', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                onSave(item);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
