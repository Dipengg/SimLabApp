import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/history.dart';

class DetailPeminjamanPage extends StatelessWidget {
  final Peminjaman peminjaman;

  const DetailPeminjamanPage({super.key, required this.peminjaman});
  
  get peminjamanList => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Peminjaman'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Peminjaman ${peminjamanList.indexOf(peminjaman) + 1}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildDetailRow('Nama Peminjam:', peminjaman.namaPeminjam),
              _buildDetailRow('NIM:', peminjaman.nim),
              _buildDetailRow('Kategori Peminjaman:', peminjaman.kategori),
              const SizedBox(height: 8),
              const Text(
                'Detail Peminjaman:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              ...peminjaman.detail.map(
                  (item) => Text('• $item', style: const TextStyle(fontSize: 16))),
              const SizedBox(height: 8),
              _buildDetailRow('Tanggal Peminjaman:', peminjaman.tanggalPeminjaman),
              _buildDetailRow('Tanggal Pengembalian:', peminjaman.tanggalPengembalian),
              _buildDetailRow('Keperluan:', peminjaman.keperluan),
              const SizedBox(height: 8),
              const Text(
                'Laporan:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Semua alat yang dipinjam, dikembalikan dengan kondisi barang yang sama.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Berikan feedback anda disini!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
               Center(
                child: GestureDetector(
                  onTap: () {
                  },
                  child: const Text(
                    'Tulis disini',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
