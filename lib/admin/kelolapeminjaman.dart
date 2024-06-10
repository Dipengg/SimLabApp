// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_peminjaman.dart';

class KelolaPeminjamanPage extends StatefulWidget {
  const KelolaPeminjamanPage({super.key});

  @override
  _KelolaPeminjamanPageState createState() => _KelolaPeminjamanPageState();
}

class _KelolaPeminjamanPageState extends State<KelolaPeminjamanPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> loans = [];
  List<Map<String, dynamic>> filteredLoans = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('http://172.20.10.5/API_PEMINJAMAN/read_peminjaman.php'));

    if (response.statusCode == 200) {
      setState(() {
        loans = List<Map<String, dynamic>>.from(json.decode(response.body));
        filteredLoans = loans;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _searchLoan(String query) {
    setState(() {
      filteredLoans = loans
          .where((loan) =>
              loan['kategori']!.toLowerCase().contains(query.toLowerCase()) ||
              loan['keperluan']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _editStatus(int peminjamanId, String status) async {
    final response = await http.post(
      Uri.parse('http://172.20.10.5/API_PEMINJAMAN/update_status_peminjaman.php'),
      body: {
        'peminjaman_id': peminjamanId.toString(),
        'status_peminjaman': status,
      },
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(content: Text('Status peminjaman diperbarui!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _fetchData();
    } else {
      final snackBar = SnackBar(content: Text('Gagal memperbarui status peminjaman.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _deletePeminjaman(int peminjamanId) async {
    final response = await http.post(
      Uri.parse('http://172.20.10.5/API_PEMINJAMAN/delete_peminjaman.php'),
      body: {
        'peminjaman_id': peminjamanId.toString(),
      },
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(content: Text('Peminjaman berhasil dihapus!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _fetchData();
    } else {
      final snackBar = SnackBar(content: Text('Gagal menghapus peminjaman.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _showEditStatusDialog(BuildContext context, int peminjamanId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Status Peminjaman'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Terima'),
                onTap: () {
                  Navigator.of(context).pop();
                  _editStatus(peminjamanId, 'Terima');
                },
              ),
              ListTile(
                title: Text('Tolak'),
                onTap: () {
                  Navigator.of(context).pop();
                  _editStatus(peminjamanId, 'Tolak');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int peminjamanId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hapus Peminjaman'),
          content: Text('Apakah Anda yakin ingin menghapus peminjaman ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deletePeminjaman(peminjamanId);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
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

  Widget _buildLoanList() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredLoans.length,
        itemBuilder: (context, index) {
          return _loanItem(filteredLoans[index], index);
        },
      ),
    );
  }

  Widget _loanItem(Map<String, dynamic> loan, int index) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(Icons.article, color: Colors.white),
      ),
      title: Text('Peminjaman ${index + 1}'),
      subtitle: Text('Keperluan: ${loan['keperluan']}'),
      trailing: loan['status_peminjaman'] == 'Belum diproses'
          ? const Icon(Icons.circle, color: Colors.green, size: 12)
          : null,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPeminjamanPage(
              peminjaman: loan,
            ),
          ),
        );
      },
      onLongPress: () {
        _showActionMenu(context, loan['id']);
      },
    );
  }

  void _showActionMenu(BuildContext context, int peminjamanId) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.edit, color: Colors.blue),
              title: Text('Edit Status'),
              onTap: () {
                Navigator.of(context).pop();
                _showEditStatusDialog(context, peminjamanId);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Hapus Peminjaman'),
              onTap: () {
                Navigator.of(context).pop();
                _showDeleteConfirmationDialog(context, peminjamanId);
              },
            ),
          ],
        );
      },
    );
  }
}
