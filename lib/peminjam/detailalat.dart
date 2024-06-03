import 'package:flutter/material.dart';

class DetailAlatPage extends StatelessWidget {
  final Map<String, String> tool;

  const DetailAlatPage({super.key, required this.tool});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Detail Alat', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(tool['image']!),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nama Alat:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(tool['name']!),
                  const SizedBox(height: 10),
                  const Text('Keycaps:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('OEM Profile (82 Keycaps)'),
                  const SizedBox(height: 10),
                  const Text('Switch:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('Red Switch'),
                  const SizedBox(height: 10),
                  const Text('Connection:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('USB Type-C, Bluetooth'),
                  const SizedBox(height: 10),
                  const Text('Size:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('75% Layout'),
                  const SizedBox(height: 10),
                  const Text('Jumlah Yang Tersedia:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('24 Unit'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}