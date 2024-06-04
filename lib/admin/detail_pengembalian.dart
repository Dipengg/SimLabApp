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
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Nama Peminjam:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(item['name']!),
              const SizedBox(height: 8),
              const Text(
                'NIM:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('6701220040'), // You may replace this with the actual data
              const SizedBox(height: 8),
              const Text(
                'Kategori Peminjaman:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Alat'),
              const SizedBox(height: 8),
              const Text(
                'Detail Peminjaman:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('• Proyektor\n• Keyboard\n• Kabel HDMI'),
              const SizedBox(height: 8),
              const Text(
                'Tanggal Peminjaman:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Minggu, 12 Mei 2024'),
              const SizedBox(height: 8),
              const Text(
                'Tanggal Pengembalian:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Rabu, 15 Mei 2024'),
              const SizedBox(height: 8),
              const Text(
                'Keperluan:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak'),
              const SizedBox(height: 8),
              const Text(
                'Status:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Belum dikembalikan'),
              const SizedBox(height: 8),
              const Text(
                'Feedback:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Aplikasi FIT-LAB sangat membantu!'),
              const SizedBox(height: 8),
              const Text(
                'Laporan:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan laporan sebagai admin',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
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
                    ),
                    child: const Text('Peringatan'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showAlertDialog(context, 'Sukses!', 'Pengembalian berhasil! Peminjaman telah selesai!', () {
                        Navigator.pop(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Konfirmasi'),
                  ),
                ],
              ),
            ],
          ),
        ),
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
