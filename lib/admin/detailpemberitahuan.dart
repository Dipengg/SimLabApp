import 'package:flutter/material.dart';

class DetailPemberitahuanPage extends StatelessWidget {
  final String title;
  final String deadline;
  final String notificationTime;
  final String category;
  final List<String> details;
  final String borrowingDate;
  final String returnDate;

  const DetailPemberitahuanPage({
    super.key,
    required this.title,
    required this.deadline,
    required this.notificationTime,
    required this.category,
    required this.details,
    required this.borrowingDate,
    required this.returnDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pemberitahuan',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Center(
              child: Text(
                'Tenggat Waktu Pengembalian',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                deadline,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              notificationTime,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            _buildDetailItem('Kategori Peminjaman:', category),
            _buildDetailItem('Detail Peminjaman:', details.join('\n')),
            _buildDetailItem('Tanggal Peminjaman:', borrowingDate),
            _buildDetailItem('Tanggal Pengembalian:', returnDate),
            const SizedBox(height: 16),
            const Text(
              'Konfirmasi pengembalian sekarang.\nTerimakasih.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
