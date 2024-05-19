import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemberitahuan!'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotificationItem(
              title: 'Selamat Datang!',
              message: 'Selamat datang di FIT LAB\n15 Sept 2022 20:55 WIB\n"Coba Fitur Sekarang"',
            ),
            _buildNotificationItem(
              title: 'Tenggat Waktu Pengembalian!',
              message: '17 Sept 2022 20:55 WIB\nAnda menerima notifikasi\n"Konfirmasi pengembalian sekarang"',
            ),
            _buildNotificationItem(
              title: 'Tenggat Waktu Pengembalian!',
              message: '17 Sept 2022 20:55 WIB\nAnda menerima notifikasi\n"Konfirmasi pengembalian sekarang"',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({required String title, required String message}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.notifications, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        onTap: () {},
      ),
    );
  }
}
