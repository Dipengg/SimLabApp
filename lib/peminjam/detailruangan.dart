import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/cart.dart';

class DetailRuanganPage extends StatelessWidget {
  final Map<String, String> ruangan;

  const DetailRuanganPage({required this.ruangan, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            Image.asset(
              ruangan['image']!,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nama Ruangan:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(ruangan['title']!),
                  const SizedBox(height: 10),
                  const Text('Kapasitas:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('30 Orang'),
                  const SizedBox(height: 10),
                  const Text('Lokasi:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('Gedung A, Lantai 2'),
                  const SizedBox(height: 10),
                  const Text('Operasi:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('08:00 - 17:00'),
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
