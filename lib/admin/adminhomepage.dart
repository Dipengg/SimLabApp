import 'package:flutter/material.dart';
import 'package:peminjaman_lab/admin/kelola_peminjaman.dart';
import 'package:peminjaman_lab/admin/kelola_alat.dart';
import 'package:peminjaman_lab/admin/kelola_pengembalian.dart';
import 'package:peminjaman_lab/admin/kelola_ruangan.dart';
import 'package:peminjaman_lab/admin/notifikasi_admin.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const AdminHomePageContent(),
    // Add other pages here if needed
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
              title: const Text('FIT-LAB',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
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
              icon: Icon(Icons.search, size: 30), label: 'Cari'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history, size: 30), label: 'Riwayat'),
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
            color: Colors.green,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Halo Alfiano!',
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
          _buildHorizontalScrollGrid(
            title: 'Daftar Alat',
            items: [
              {'title': 'Proyektor', 'image': 'images/proyektor.jpg'},
              {'title': 'Keyboard', 'image': 'images/keyboard.jpg'},
            ],
          ),
          _buildHorizontalScrollGrid(
            title: 'Daftar Ruangan',
            items: [
              {'title': 'Laboratorium A1', 'image': 'images/lab_a1.jpg'},
              {'title': 'Laboratorium A2', 'image': 'images/lab_a2.jpg'},
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createButton(context, 'Kelola Peminjaman', Icons.library_books, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const KelolaPeminjamanPage()),
            );
          }),
          _createButton(context, 'Kelola Alat', Icons.build, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const KelolaAlatPage()),
            );
          }),
          _createButton(context, 'Kelola Pengembalian', Icons.history, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const KelolaPengembalianPage()),
            );
          }),
          _createButton(context, 'Kelola Ruangan', Icons.meeting_room, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const KelolaRuanganPage()),
            );
          }),
        ],
      ),
    );
  }

  Widget _createButton(BuildContext context, String title, IconData icon,
      VoidCallback onPressed) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(12),
          ),
          child: Icon(icon, color: Colors.white, size: 30),
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
    );
  }

  Widget _buildHorizontalScrollGrid(
      {required String title, required List<Map<String, String>> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _gridItem(items[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _gridItem(Map<String, String> item) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item['image']!,
              height: 80,
              width: 80,
            ),
            const SizedBox(height: 10),
            Text(
              item['title']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
