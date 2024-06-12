// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPeminjamanPage extends StatelessWidget {
  final Map<String, dynamic> peminjaman;

  const DetailPeminjamanPage({
    required this.peminjaman,
    super.key,
  });

  void _updateStatus(BuildContext context, String status) async {
    final response = await http.post(
      Uri.parse('http://172.20.10.5/API_SIMLAB/Peminjaman/update_status_peminjaman.php'),
      body: {
        'peminjaman_id': peminjaman['id'].toString(),
        'status_peminjaman': status,
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(
        'Sent data: peminjaman_id=${peminjaman['id'].toString()}, status_peminjaman=$status');

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['pesan'] == 'Sukses') {
        final snackBar =
            SnackBar(content: Text('Status peminjaman diperbarui!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pop();
      } else {
        final snackBar = SnackBar(
            content: Text(
                'Gagal memperbarui status peminjaman: ${responseData['error']}'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      final snackBar =
          SnackBar(content: Text('Gagal memperbarui status peminjaman.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _deletePeminjaman(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://192.168.18.182/API_SIMLAB/Peminjaman/delete_peminjaman.php'),
      body: {
        'peminjaman_id': peminjaman['id'].toString(),
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['pesan'] == 'Sukses') {
        final snackBar =
            SnackBar(content: Text('Peminjaman berhasil dihapus!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pop();
      } else {
        final snackBar = SnackBar(
            content:
                Text('Gagal menghapus peminjaman: ${responseData['error']}'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      final snackBar = SnackBar(content: Text('Gagal menghapus peminjaman.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Peminjaman'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Peminjaman Detail',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildDetailItem('Nama Peminjam:', 'Roila Rachipan'),
              _buildDetailItem('NIM:', '6701220000'),
              _buildDetailItem('Kategori Peminjaman:',
                  peminjaman['kategori'] ?? 'Tidak ada kategori'),
              _buildDetailItem('Detail Peminjaman:',
                  peminjaman['detail_peminjaman'] ?? 'Tidak ada detail'),
              _buildDetailItem(
                  'Tanggal Peminjaman:',
                  peminjaman['tanggal_peminjaman'] ??
                      'Tidak ada tanggal peminjaman'),
              _buildDetailItem(
                  'Tanggal Pengembalian:',
                  peminjaman['tanggal_pengembalian'] ??
                      'Tidak ada tanggal pengembalian'),
              _buildDetailItem('Keperluan:',
                  peminjaman['keperluan'] ?? 'Tidak ada keperluan'),
              _buildDetailItem('Status Peminjaman:',
                  peminjaman['status_peminjaman'] ?? 'Tidak ada status'),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => _updateStatus(context, 'Ditolak'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Tolak', style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton(
                    onPressed: () => _updateStatus(context, 'Diterima'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Terima', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => _showDeleteConfirmationDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Hapus Peminjaman',
                      style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
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
                _deletePeminjaman(context);
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
}
