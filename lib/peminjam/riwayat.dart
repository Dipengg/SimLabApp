import 'package:flutter/material.dart';
import 'detailpeminjaman.dart';
import 'homepage.dart';
import 'search.dart';
import 'profile.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final List<Peminjaman> peminjamanList = [
    Peminjaman(
      namaPeminjam: 'Alfiano Fadhilah Rachman',
      nim: '6701220040',
      kategori: 'Alat',
      detail: ['Proyektor', 'Keyboard', 'Kabel HDMI'],
      tanggalPeminjaman: 'Minggu, 12 Mei 2024',
      tanggalPengembalian: 'Rabu, 15 Mei 2024',
      keperluan: 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak',
    ),
    Peminjaman(
      namaPeminjam: 'Louis Diaz Sanjaya',
      nim: '6701220069',
      kategori: 'Alat',
      detail: ['Proyektor', 'Keyboard'],
      tanggalPeminjaman: 'Senin, 21 Mei 2024',
      tanggalPengembalian: 'Kamis, 24 Mei 2024',
      keperluan: 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak',
    ),
    Peminjaman(
      namaPeminjam: 'Rayyan Ali Bahasyim',
      nim: '6701223058',
      kategori: 'Alat',
      detail: ['Proyektor'],
      tanggalPeminjaman: 'Selasa, 27 Mei 2024',
      tanggalPengembalian: 'Jumat, 30 Mei 2024',
      keperluan: 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Peminjaman'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: peminjamanList.length,
        itemBuilder: (context, index) {
          final peminjaman = peminjamanList[index];
          return ListTile(
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
          );
        },
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

class DetailPeminjamanPage extends StatelessWidget {
  final Peminjaman peminjaman;

  const DetailPeminjamanPage({super.key, required this.peminjaman});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Peminjaman'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Peminjam: ${peminjaman.namaPeminjam}'),
            Text('NIM: ${peminjaman.nim}'),
            Text('Kategori: ${peminjaman.kategori}'),
            Text('Detail: ${peminjaman.detail.join(', ')}'),
            Text('Tanggal Peminjaman: ${peminjaman.tanggalPeminjaman}'),
            Text('Tanggal Pengembalian: ${peminjaman.tanggalPengembalian}'),
            Text('Keperluan: ${peminjaman.keperluan}'),
          ],
        ),
      ),
    );
  }
}
