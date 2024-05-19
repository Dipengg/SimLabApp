import 'package:flutter/material.dart';

class ToolDetailPage extends StatelessWidget {
  final Map<String, String> tool;

  const ToolDetailPage({Key? key, required this.tool}) : super(key: key);

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
                  Text('Nama Alat:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(tool['name']!),
                  SizedBox(height: 10),
                  Text('Keycaps:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('OEM Profile (82 Keycaps)'),
                  SizedBox(height: 10),
                  Text('Switch:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Red Switch'),
                  SizedBox(height: 10),
                  Text('Connection:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('USB Type-C, Bluetooth'),
                  SizedBox(height: 10),
                  Text('Size:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('75% Layout'),
                  SizedBox(height: 10),
                  Text('Jumlah Yang Tersedia:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('24 Unit'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
