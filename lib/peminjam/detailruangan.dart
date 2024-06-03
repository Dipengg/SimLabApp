import 'package:flutter/material.dart';

class DetailRuanganPage extends StatelessWidget {
  final Map<String, String> room;

  const DetailRuanganPage({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Detail Ruangan', style: TextStyle(color: Colors.black)),
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
            Image.asset(room['image']!),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nama Ruangan:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room['name']!),
                  const SizedBox(height: 10),
                  const Text('Kapasitas:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room['capacity']!),
                  const SizedBox(height: 10),
                  const Text('Lokasi:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room['location']!),
                  const SizedBox(height: 10),
                  const Text('Operation:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room['operation']!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}