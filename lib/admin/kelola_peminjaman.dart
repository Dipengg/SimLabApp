import 'package:flutter/material.dart';

class KelolaPeminjamanPage extends StatelessWidget {
  const KelolaPeminjamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Peminjaman'),
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
              'Catatan:\nPeminjaman yang belum di proses, akan muncul notifikasi disamping.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            _buildLoanList(),
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

  Widget _buildLoanList() {
    final loans = [
      {'title': 'Peminjaman 1', 'name': 'Rayyan Ali Bahasyim'},
      {'title': 'Peminjaman 2', 'name': 'Louis Diaz Sanjaya'},
      {'title': 'Peminjaman 3', 'name': 'Alfiano Fadhilah Rach.'},
      {'title': 'Peminjaman 4', 'name': 'Ikhsan Fadli Nugraha'},
      {'title': 'Peminjaman 5', 'name': 'Nadhif Arrafi Waltam'},
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: loans.length,
        itemBuilder: (context, index) {
          return _loanItem(loans[index]);
        },
      ),
    );
  }

  Widget _loanItem(Map<String, String> loan) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(Icons.article, color: Colors.white),
      ),
      title: Text(loan['title']!),
      subtitle: Text('Dibuat oleh: ${loan['name']}'),
      trailing: loan['title'] == 'Peminjaman 3'
          ? const Icon(Icons.circle, color: Colors.green, size: 12)
          : null,
    );
  }
}
