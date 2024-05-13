import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Peminjaman'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.library_books, color: Colors.white),
            ),
            title: Text('Peminjaman ${index + 1}'),
            subtitle: Text('Detail riwayat peminjaman ${index + 1}'),
            onTap: () {
            },
          );
        },
      ),
    );
  }
}
