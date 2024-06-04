import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/detailpemberitahuan.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pemberitahuan',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotificationItem(
              context,
              title: 'Tenggat Waktu Pengembalian!',
              message: '01 Juni 2024 (08:30 WIB)\nAnda menerima notifikasi "Konfirmasi Pengembalian Sekarang"',
              navigateToDetail: true,
            ),
            _buildNotificationItem(
              context,
              title: 'Selamat Datang!',
              message: '15 Mei 2024 (10:30 WIB)\nSelamat datang di SIMLAB "Coba Fitur Sekarang"',
              navigateToDetail: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(BuildContext context, {required String title, required String message, required bool navigateToDetail}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.notifications, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        onTap: navigateToDetail
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPemberitahuanPage(
                      title: 'Tenggat Waktu Pengembalian',
                      deadline: '01 Juni 2024 (08:30 WIB)',
                      notificationTime: 'Anda telah memasuki tenggat waktu pengembalian untuk data pengembalian:',
                      category: 'Alat',
                      details: ['Proyektor', 'Keyboard', 'Kabel HDMI'],
                      borrowingDate: 'Minggu, 12 Mei 2024',
                      returnDate: 'Rabu, 15 Mei 2024',
                    ),
                  ),
                );
              }
            : null,
      ),
    );
  }
}
