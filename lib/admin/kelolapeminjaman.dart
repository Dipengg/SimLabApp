import 'package:flutter/material.dart';
import 'package:peminjaman_lab/admin/detail_peminjaman.dart';

class KelolaPeminjamanPage extends StatefulWidget {
  const KelolaPeminjamanPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KelolaPeminjamanPageState createState() => _KelolaPeminjamanPageState();
}

class _KelolaPeminjamanPageState extends State<KelolaPeminjamanPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> loans = [
    {'title': 'Peminjaman 1', 'name': 'Rayyan Ali Bahasyim'},
    {'title': 'Peminjaman 2', 'name': 'Louis Diaz Sanjaya'},
    {'title': 'Peminjaman 3', 'name': 'Alfiano Fadhilah Rach.'},
    {'title': 'Peminjaman 4', 'name': 'Ikhsan Fadli Nugraha'},
    {'title': 'Peminjaman 5', 'name': 'Nadhif Arrafi Waltam'},
  ];
  List<Map<String, String>> filteredLoans = [];

  @override
  void initState() {
    super.initState();
    filteredLoans = loans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kelola Peminjaman',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
              'Catatan:\nPeminjaman yang belum diproses, akan muncul notifikasi disamping.',
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
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          _searchLoan(value);
        },
        decoration: const InputDecoration(
          hintText: 'Cari',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  void _searchLoan(String query) {
    setState(() {
      filteredLoans = loans
          .where((loan) =>
              loan['title']!.toLowerCase().contains(query.toLowerCase()) ||
              loan['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildLoanList() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredLoans.length,
        itemBuilder: (context, index) {
          return _loanItem(filteredLoans[index]);
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPeminjamanPage(
              title: loan['title']!,
              name: loan['name']!,
            ),
          ),
        );
      },
    );
  }
}
