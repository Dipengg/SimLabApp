import 'package:flutter/material.dart';
import 'detailpeminjaman.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  builder: (context) => DetailPeminjamanPage(peminjaman: peminjaman),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

