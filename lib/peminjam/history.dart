import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/detailpeminjaman.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final List<Peminjaman> peminjamanList = [
    Peminjaman(
      namaPeminjam: 'Roila Rachipan',
      nim: '6701220000',
      kategori: 'Alat',
      detail: ['Proyektor', 'Keyboard', 'Kabel HDMI'],
      tanggalPeminjaman: '12 Mei 2024',
      tanggalPengembalian: '15 Mei 2024',
      keperluan: 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak',
    ),
    Peminjaman(
      namaPeminjam: 'Roila Rachipan',
      nim: '6701220000',
      kategori: 'Alat',
      detail: ['Proyektor', 'Keyboard'],
      tanggalPeminjaman: '21 Mei 2024',
      tanggalPengembalian: '24 Mei 2024',
      keperluan: 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak',
    ),
    Peminjaman(
      namaPeminjam: 'Roila Rachipan',
      nim: '6701223000',
      kategori: 'Alat',
      detail: ['Proyektor'],
      tanggalPeminjaman: '27 Mei 2024',
      tanggalPengembalian: '30 Mei 2024',
      keperluan: 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Peminjaman',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: peminjamanList.length,
          itemBuilder: (context, index) {
            final peminjaman = peminjamanList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.library_books, color: Colors.white),
                ),
                title: Text('Peminjaman ${index + 1}'),
                subtitle: Text('Tanggal : ${peminjaman.tanggalPeminjaman}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPeminjamanPage(peminjaman: peminjaman),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Peminjaman {
  final String namaPeminjam;
  final String nim;
  final String kategori;
  final List<String> detail;
  final String tanggalPeminjaman;
  final String tanggalPengembalian;
  final String keperluan;

  Peminjaman({
    required this.namaPeminjam,
    required this.nim,
    required this.kategori,
    required this.detail,
    required this.tanggalPeminjaman,
    required this.tanggalPengembalian,
    required this.keperluan,
  });
}
