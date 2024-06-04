import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/history.dart';

class DetailPeminjamanPage extends StatelessWidget {
  final Peminjaman peminjaman;
  final String title;

  const DetailPeminjamanPage({super.key, required this.peminjaman, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Peminjaman', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildDetailRow('Nama Peminjam:', peminjaman.namaPeminjam),
            _buildDetailRow('NIM:', peminjaman.nim),
            _buildDetailRow('Kategori Peminjaman:', peminjaman.kategori),
            _buildDetailRow('Detail Peminjaman:', ''),
            _buildDetailList(peminjaman.detail),
            _buildDetailRow('Tanggal Peminjaman:', peminjaman.tanggalPeminjaman),
            _buildDetailRow('Tanggal Pengembalian:', peminjaman.tanggalPengembalian),
            _buildDetailRow('Keperluan:', peminjaman.keperluan),
            _buildDetailRow('Laporan:', 'Semua alat yang dipinjam, dikembalikan dengan kondisi barang yang sama.'),
            const Spacer(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Berikan feedback anda disini! Tulis disini',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title ',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: content,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) => Text('• $item')).toList(),
      ),
    );
  }
}