import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/formpeminjaman.dart';
import 'package:peminjaman_lab/peminjam/search.dart';
import 'package:peminjaman_lab/peminjam/history.dart';
import 'package:peminjaman_lab/peminjam/profile.dart';
import 'package:peminjaman_lab/peminjam/notification.dart';
import 'package:peminjaman_lab/peminjam/daftaralat.dart';
import 'package:peminjaman_lab/peminjam/daftarruangan.dart';
import 'package:peminjaman_lab/peminjam/cart.dart';

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
              elevation: 0,
              title: const Text(
                'SIMLAB',
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
                          builder: (context) => const NotificationPage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage()),
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
              icon: Icon(Icons.person, size: 30), label: 'Profile'),
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
                  'Selamat datang di SIMLAB! Kemudahan untuk meminjam.',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 20),
                _buildButtonSection(context),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildHorizontalScrollGrid(
            context: context,
            title: 'Daftar Alat',
            items: [
              {'title': 'Proyektor', 'image': 'images/proyektor.jpg'},
              {'title': 'Keyboard', 'image': 'images/keyboard.jpg'},
              {'title': 'Mouse', 'image': 'images/mouse.jpg'},
            ],
            isEquipment: true,
          ),
          _buildHorizontalScrollGrid(
            context: context,
            title: 'Daftar Ruangan',
            items: [
              {'title': 'Laboratorium A1', 'image': 'images/lab_a1.jpg'},
              {'title': 'Laboratorium A2', 'image': 'images/lab_a2.jpg'},
              {'title': 'Laboratorium B1', 'image': 'images/lab_a3.jpg'},
            ],
            isEquipment: false,
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

  Widget _buildHorizontalScrollGrid({
    required BuildContext context,
    required String title,
    required List<Map<String, String>> items,
    required bool isEquipment,
  }) {
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
              return _gridItem(context, items[index], isEquipment);
            },
          ),
        ),
      ],
    );
  }

  Widget _gridItem(BuildContext context, Map<String, String> item, bool isEquipment) {
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
