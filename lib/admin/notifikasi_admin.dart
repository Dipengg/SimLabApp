import 'package:flutter/material.dart';

class NotificationAdminPage extends StatelessWidget {
  const NotificationAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemberitahuan'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotificationItem(
              title: 'Tenggat Waktu Pengembalian!',
              date: '01 Juni 2024 (08:30 WIB)',
              message: 'Anda menerima notifikasi\n"Konfirmasi Pengembalian Sekarang"',
            ),
            _buildNotificationItem(
              title: 'Selamat Datang!',
              date: '15 Mei 2024 (10:30 WIB)',
              message: 'Selamat datang di SIMLAB\n"Coba Fitur Sekarang"',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String date,
    required String message,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.notifications, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            Text(message),
          ],
        ),
        onTap: () {
          // Add your onTap code here
        },
      ),
    );
  }
}
