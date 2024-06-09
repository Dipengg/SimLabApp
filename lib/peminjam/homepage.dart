import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/detailalat.dart';
import 'package:peminjaman_lab/peminjam/detailruangan.dart';
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
                      MaterialPageRoute(builder: (context) => const CartPage()),
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
                  'Halo User!',
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
          _buildStatusDescription(),
          _buildCategoryScrollSection(
            context: context,
            title: 'Daftar Alat',
            items: [
              {
                'title': 'Proyektor',
                'image': 'images/proyektor.jpg',
                'status': 'available'
              },
              {
                'title': 'Keyboard',
                'image': 'images/keyboard.jpg',
                'status': 'low'
              },
              {
                'title': 'Mouse',
                'image': 'images/mouse.jpg',
                'status': 'not available'
              },
              {
                'title': 'Printer',
                'image': 'images/printer.jpg',
                'status': 'available'
              },
              {
                'title': 'Kabel LAN',
                'image': 'images/kabel_lan.jpg',
                'status': 'low'
              },
            ],
            navigateTo: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DaftarAlatPage()),
              );
            },
          ),
          _buildCategoryScrollSection(
            context: context,
            title: 'Daftar Ruangan',
            items: [
              {
                'title': 'Laboratorium A1',
                'image': 'images/lab_a1.jpg',
                'status': 'available'
              },
              {
                'title': 'Laboratorium A2',
                'image': 'images/lab_a2.jpg',
                'status': 'low'
              },
              {
                'title': 'Laboratorium A3',
                'image': 'images/lab_a3.jpg',
                'status': 'not available'
              },
              {
                'title': 'Laboratorium A4',
                'image': 'images/lab_a4.jpg',
                'status': 'available'
              },
            ],
            navigateTo: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DaftarRuanganPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statusIndicator(Colors.green, 'Tersedia'),
          _statusIndicator(Colors.red, 'Stok Sedikit'),
          _statusIndicator(Colors.black, 'Tidak Tersedia'),
        ],
      ),
    );
  }

  Widget _statusIndicator(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _createIconButton(context, 'Peminjaman', Icons.library_books, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormPeminjamanPage(),
                  ),
                );
              }),
              const SizedBox(width: 16),
              _createIconButton(context, 'Daftar Alat', Icons.build, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DaftarAlatPage()),
                );
              }),
              const SizedBox(width: 16),
              _createIconButton(context, 'Daftar Ruangan', Icons.meeting_room, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DaftarRuanganPage()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createIconButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return Column(
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
    Color statusColor;

    switch (item['status']) {
      case 'available':
        statusColor = Colors.green;
        break;
      case 'low':
        statusColor = Colors.red;
        break;
      case 'not available':
        statusColor = Colors.black;
        break;
      default:
        statusColor = Colors.grey;
    }

    return GestureDetector(
      onTap: () {
        if (item['title']!.contains('Laboratorium')) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailRuanganPage(ruangan: item),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailAlatPage(alat: item),
            ),
          );
        }
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(item['image']!),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  item['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
