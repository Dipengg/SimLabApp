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
              title: 'Perhatian',
              message: 'Tenggat masa peminjaman untuk proyektor telah habis.',
            ),
            _buildNotificationItem(
              title: 'Penting',
              message: 'Segera kembalikan alat "Keyboard" ke laboratorium.',
            ),
            _buildNotificationItem(
              title: 'Informasi',
              message: 'Laboratorium AI akan ditutup untuk perawatan pada tanggal 15 Mei 2024.',
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
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        onTap: () {
        },
      ),
    );
  }
}
