import 'package:flutter/material.dart';
import 'package:peminjaman_lab/admin/kelola_peminjaman.dart';
import 'package:peminjaman_lab/admin/kelola_alat.dart';
import 'package:peminjaman_lab/admin/kelola_pengembalian.dart';
import 'package:peminjaman_lab/admin/kelola_ruangan.dart';
import 'package:peminjaman_lab/admin/notifikasi_admin.dart';
import 'package:peminjaman_lab/admin/profile_admin.dart';
import 'package:peminjaman_lab/admin/edit_alat.dart';
import 'package:peminjaman_lab/admin/edit_ruangan.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const AdminHomePageContent(),
    const KelolaPeminjamanPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: Colors.green,
              elevation: 0,
              title: const Text(
                'FIT-LAB',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationAdminPage()),
                    );
                  },
                ),
              ],
            )
          : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books, size: 30), label: 'Peminjaman'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.green),
        unselectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}

class AdminHomePageContent extends StatelessWidget {
  const AdminHomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.teal],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Halo Admin!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Selamat datang di FIT-LAB! Kemudahan untuk meminjam.',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 20),
                _buildButtonSection(context),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildCategoryScrollSection(
            context: context,
            title: 'Daftar Alat',
            items: [
              {'title': 'Proyektor', 'image': 'images/proyektor.jpg', 'stok': '10'},
              {'title': 'Keyboard', 'image': 'images/keyboard.jpg', 'stok': '15'},
              {'title': 'Mouse', 'image': 'images/mouse.jpg'},
              {'title': 'Printer', 'image': 'images/printer.jpg'},
              {'title': 'Kabel LAN', 'image': 'images/kabel_lan.jpg'},
            ],
            navigateTo: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const KelolaAlatPage()),
              );
            },
          ),
          _buildCategoryScrollSection(
            context: context,
            title: 'Daftar Ruangan',
            items: [
              {'title': 'Laboratorium A1', 'image': 'images/lab_a1.jpg', 'kapasitas': '50 orang'},
              {'title': 'Laboratorium A2', 'image': 'images/lab_a2.jpg', 'kapasitas': '40 orang'},
              {'title': 'Laboratorium A3', 'image': 'images/lab_a3.jpg'},
              {'title': 'Laboratorium A4', 'image': 'images/lab_a4.jpg'},
            ],
            navigateTo: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const KelolaRuanganPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _createIconButton(context, 'Kelola Peminjaman', Icons.library_books, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KelolaPeminjamanPage(),
                  ),
                );
              }),
              _createIconButton(context, 'Kelola Alat', Icons.build, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KelolaAlatPage()),
                );
              }),
              _createIconButton(context, 'Kelola Pengembalian', Icons.history, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KelolaPengembalianPage()),
                );
              }),
              _createIconButton(context, 'Kelola Ruangan', Icons.meeting_room, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KelolaRuanganPage(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createIconButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          IconButton(
            icon: Tooltip(
              message: title,
              child: Icon(icon, color: Colors.green, size: 30),
            ),
            onPressed: onPressed,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryScrollSection({
    required BuildContext context,
    required String title,
    required List<Map<String, String>> items,
    required VoidCallback navigateTo,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: navigateTo,
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _horizontalGridItem(context, items[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _horizontalGridItem(BuildContext context, Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        if (item['title'] != null && item['image'] != null) {
          if (item['title']!.contains('Laboratorium')) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditRuanganPage(
                  ruanganName: item['title']!,
                  room: item,
                ),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditAlatPage(
                  alatName: item['title']!,
                  alat: item, item: const {},
                ),
              ),
            );
          }
        }
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  item['image']!,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (item.containsKey('stok'))
                      Text(
                        'Stok: ${item['stok']}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    if (item.containsKey('kapasitas'))
                      Text(
                        'Kapasitas: ${item['kapasitas']}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

