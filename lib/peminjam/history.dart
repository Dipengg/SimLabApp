import 'package:flutter/material.dart';

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
      tanggalPeminjaman: '12 Mei 2024',
      tanggalPengembalian: '15 Mei 2024',
      keperluan: 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak',
    ),
    Peminjaman(
      namaPeminjam: 'Louis Diaz Sanjaya',
      nim: '6701220069',
      kategori: 'Alat',
      detail: ['Proyektor', 'Keyboard'],
      tanggalPeminjaman: '21 Mei 2024',
      tanggalPengembalian: '24 Mei 2024',
      keperluan: 'Praktikum Mata Kuliah Dasar Pemrograman Perangkat Bergerak',
    ),
    Peminjaman(
      namaPeminjam: 'Rayyan Ali Bahasyim',
      nim: '6701223058',
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
        title: const Text('Riwayat Peminjaman',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
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
  
  get peminjamanList => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Peminjaman'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Peminjaman ${peminjamanList.indexOf(peminjaman) + 1}', 
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text('Nama Peminjam: ${peminjaman.namaPeminjam}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('NIM: ${peminjaman.nim}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Kategori Peminjaman: ${peminjaman.kategori}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              const Text('Detail Peminjaman:', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              ...peminjaman.detail.map((item) => Text('• $item', style: const TextStyle(fontSize: 16))),
              const SizedBox(height: 8),
              Text('Tanggal Peminjaman: ${peminjaman.tanggalPeminjaman}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Tanggal Pengembalian: ${peminjaman.tanggalPengembalian}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Keperluan: ${peminjaman.keperluan}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              const Text('Laporan:', style: TextStyle(fontSize: 16)),
              const Text('Semua alat yang dipinjam, dikembalikan dengan kondisi barang yang sama.', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text('Berikan feedback anda disini! Tulis disini', style: TextStyle(fontSize: 16, color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
