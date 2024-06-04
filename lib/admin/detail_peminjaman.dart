import 'package:flutter/material.dart';

class DetailPeminjamanPage extends StatelessWidget {
  final String title;
  final String name;

  const DetailPeminjamanPage({
    super.key,
    required this.title,
    required this.name,
  });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Peminjaman 3',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Nama Peminjam:\n$name',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'NIM:\n6701220040',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kategori Peminjaman:\nAlat',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Detail Peminjaman:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Proyektor\n- Keyboard\n- Kabel HDMI',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tanggal Peminjaman:\nMinggu, 12 Mei 2024',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tanggal Pengembalian:\nRabu, 15 Mei 2024',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Keperluan:\nPraktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showRejectionDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Tolak'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showApprovalSuccessDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Terima'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRejectionDialog(BuildContext context) {
    final TextEditingController _reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pengajuan Ditolak'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Alasan:'),
              TextField(
                controller: _reasonController,
                decoration: const InputDecoration(
                  hintText: 'Silahkan masukkan alasan penolakan',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSuccessDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Kirim'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sukses!'),
          content: const Text(
            'Pemberitahuan alasan penolakan berhasil dikirim!',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Oke'),
            ),
          ],
        );
      },
    );
  }

  void _showApprovalSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sukses!'),
          content: const Text(
            'Pengajuan berhasil! Pemberitahuan berhasil dikirim!',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Oke'),
            ),
          ],
        );
      },
    );
  }
}
