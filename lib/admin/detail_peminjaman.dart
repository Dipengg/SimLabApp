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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Peminjaman 3',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildDetailItem('Nama Peminjam:', name),
              _buildDetailItem('NIM:', '6701220040'),
              _buildDetailItem('Kategori Peminjaman:', 'Alat'),
              _buildDetailItem('Detail Peminjaman:', '- Proyektor\n- Keyboard\n- Kabel HDMI'),
              _buildDetailItem('Tanggal Peminjaman:', 'Minggu, 12 Mei 2024'),
              _buildDetailItem('Tanggal Pengembalian:', 'Rabu, 15 Mei 2024'),
              _buildDetailItem('Keperluan:', 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak'),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showRejectionDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Tolak', style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showApprovalSuccessDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Terima', style: TextStyle(fontSize: 16)),
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
