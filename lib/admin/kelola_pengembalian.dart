import 'package:flutter/material.dart';

class KelolaPengembalianPage extends StatelessWidget {
  const KelolaPengembalianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Pengembalian'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 20),
            const Text(
              'Catatan:\nPengembalian yang belum di proses, akan muncul notifikasi disamping.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            _buildReturnList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Cari',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildReturnList() {
    final returns = [
      {'title': 'Pengembalian 1', 'name': 'Rayyan Ali Bahasyim'},
      {'title': 'Pengembalian 2', 'name': 'Louis Diaz Sanjaya'},
      {'title': 'Pengembalian 3', 'name': 'Alfiano Fadhilah Rach.'},
      {'title': 'Pengembalian 4', 'name': 'Ikhsan Fadli Nugraha'},
      {'title': 'Pengembalian 5', 'name': 'Nadhif Arrafi Waltam'},
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: returns.length,
        itemBuilder: (context, index) {
          return _returnItem(returns[index]);
        },
      ),
    );
  }

  Widget _returnItem(Map<String, String> item) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: const Icon(Icons.assignment_return, color: Colors.white),
      ),
      title: Text(item['title']!),
      subtitle: Text('Dikembalikan oleh: ${item['name']}'),
      trailing: item['title'] == 'Pengembalian 3'
          ? const Icon(Icons.circle, color: Colors.green, size: 12)
          : null,
    );
  }
}
