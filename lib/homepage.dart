import 'package:flutter/material.dart';
import 'search.dart';
import 'history.dart';
import 'profile.dart';
import 'notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Halo Rayyantol!'),
        centerTitle: true,
        actions: <Widget>[
  IconButton(
    icon: const Icon(Icons.notifications),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotificationPage()),
      );
    },
  ),
],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildButtonSection(),
            _buildItemGrid(title: 'Daftar Alat', items: ['Proyektor', 'Keyboard']),
            _buildItemGrid(title: 'Daftar Ruangan', items: ['Laboratorium AI', 'Laboratorium A2']),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.history, size: 30), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 30), label: 'Profil'),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch(index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HistoryPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }

  Widget _buildButtonSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createButton('Peminjaman', Icons.library_books),
          _createButton('Daftar Alat', Icons.build),
          _createButton('Daftar Ruangan', Icons.meeting_room),
        ],
      ),
    );
  }

  Widget _createButton(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white, size: 20),
        label: Text(title),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildItemGrid({required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: items.map((item) => _gridItem(item)).toList(),
        ),
      ],
    );
  }

  Widget _gridItem(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(title, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
