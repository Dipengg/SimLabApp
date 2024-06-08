import 'package:flutter/material.dart';

class DetailPengembalianPage extends StatelessWidget {
  final Map<String, String> item;

  const DetailPengembalianPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengembalian'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title']!,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildDetailItem('Nama Peminjam:', item['name']!),
              _buildDetailItem('NIM:', '6701220040'),
              _buildDetailItem('Kategori Peminjaman:', 'Alat'),
              _buildDetailItem('Detail Peminjaman:', '• Proyektor\n• Keyboard\n• Kabel HDMI'),
              _buildDetailItem('Tanggal Peminjaman:', 'Minggu, 12 Mei 2024'),
              _buildDetailItem('Tanggal Pengembalian:', 'Rabu, 15 Mei 2024'),
              _buildDetailItem('Keperluan:', 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak'),
              _buildDetailItem('Status:', 'Belum dikembalikan'),
              _buildDetailItem('Feedback:', 'Aplikasi FIT-LAB sangat membantu!'),
              const SizedBox(height: 8),
              const Text(
                'Laporan:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan laporan sebagai admin',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showAlertDialog(context, 'Validasi', 'Apakah anda yakin ingin mengirimkan pesan peringatan?', () {
                        Navigator.pop(context);
                        _showAlertDialog(context, 'Sukses!', 'Pesan pengingat berhasil dikirim!', () {
                          Navigator.pop(context);
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Peringatan', style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showAlertDialog(context, 'Sukses!', 'Pengembalian berhasil! Peminjaman telah selesai!', () {
                        Navigator.pop(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Konfirmasi', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String title, String content, VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Row(
            children: [
              title == 'Validasi'
                  ? const Icon(Icons.warning, color: Colors.yellow)
                  : const Icon(Icons.check_circle, color: Colors.green),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
          content: Text(content),
          actions: [
            title == 'Validasi'
                ? TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Tidak', style: TextStyle(color: Colors.red)),
                  )
                : Container(),
            TextButton(
              onPressed: onPressed,
              child: Text(title == 'Validasi' ? 'Yakin' : 'Oke'),
            ),
          ],
        );
      },
    );
  }
}
