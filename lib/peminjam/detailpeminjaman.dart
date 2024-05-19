import 'package:flutter/material.dart';

class Peminjaman {
  final String namaPeminjam;
  final String nim;
  final String kategori;
  final List<String> detail;
  final String tanggalPeminjaman;
  final String tanggalPengembalian;
  final String keperluan;

  Peminjaman({
    required this.namaPeminjam,
    required this.nim,
    required this.kategori,
    required this.detail,
    required this.tanggalPeminjaman,
    required this.tanggalPengembalian,
    required this.keperluan,
  });
}

class DetailPeminjamanPage extends StatelessWidget {
  final Peminjaman peminjaman;

  const DetailPeminjamanPage({super.key, required this.peminjaman});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Peminjaman'),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Peminjaman',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nama Peminjam:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(peminjaman.namaPeminjam),
            const SizedBox(height: 8),
            const Text(
              'NIM:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(peminjaman.nim),
            const SizedBox(height: 8),
            const Text(
              'Kategori Peminjaman:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(peminjaman.kategori),
            const SizedBox(height: 8),
            const Text(
              'Detail Peminjaman:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(peminjaman.detail.join('\n')),
            const SizedBox(height: 8),
            const Text(
              'Tanggal Peminjaman:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(peminjaman.tanggalPeminjaman),
            const SizedBox(height: 8),
            const Text(
              'Tanggal Pengembalian:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(peminjaman.tanggalPengembalian),
            const SizedBox(height: 8),
            const Text(
              'Keperluan:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(peminjaman.keperluan),
          ],
        ),
      ),
    );
  }
}

