import 'package:flutter/material.dart';
import 'formpeminjaman.dart';
import 'search.dart';
import 'riwayat.dart';
import 'profile.dart';
import 'notification.dart';
import 'daftaralat.dart';
import 'daftarruangan.dart';
import 'keranjang.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePageContent(),
    const SearchPage(),
    const RiwayatPage(),
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
              title: const Text('SIMLAB'),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KeranjangPage()),
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

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Halo, Ariel!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          _buildButtonSection(context),
          _buildItemGrid(
            title: 'Daftar Alat',
            items: [
              {'title': 'Proyektor', 'image': 'images/proyektor.jpg'},
              {'title': 'Keyboard', 'image': 'images/keyboard.jpg'},
            ],
          ),
          _buildItemGrid(
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _createButton(context, 'Peminjaman', Icons.library_books, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FormPeminjamanPage()),
              );
            }),
            _createButton(context, 'Daftar Alat', Icons.build, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DaftarAlatPage()),
              );
            }),
            _createButton(context, 'Daftar Ruangan', Icons.meeting_room, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DaftarRuanganPage()),
              );
            }),
          ],
        ),
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

  Widget _buildItemGrid(
      {required String title, required List<Map<String, String>> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: items.map((item) => _gridItem(item)).toList(),
        ),
      ],
    );
  }

  Widget _gridItem(Map<String, String> item) {
    return Card(
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
    );
  }
}
