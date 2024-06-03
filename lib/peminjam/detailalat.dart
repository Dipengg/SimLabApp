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
            Container(
              margin: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(tool['image']!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nama Alat:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(tool['name']!),
                  const SizedBox(height: 10),
                  const Text('Jumlah Yang Tersedia:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('24 Unit'),
                  const SizedBox(height: 10),
                  const Text('Kondisi:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('Cukup'),
                  const SizedBox(height: 10),
                  const Text('Status:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('Tersedia'),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Tambah ke keranjang'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
