import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/cart.dart';

class DetailAlatPage extends StatelessWidget {
  final Map<String, dynamic> tool;

  const DetailAlatPage({super.key, required this.tool});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            Image.asset(
              tool['image']!,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                child: const Text('Tambah ke keranjang', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
