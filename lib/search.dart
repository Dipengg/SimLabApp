import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, dynamic>> _items = [
    {'name': 'Proyektor', 'icon': Icons.desktop_windows},
    {'name': 'Keyboard', 'icon': Icons.keyboard},
    {'name': 'Power Supply', 'icon': Icons.power},
    {'name': 'RAM', 'icon': Icons.memory},
    {'name': 'Kabel HDMI', 'icon': Icons.cable},
    {'name': 'Kabel Jack', 'icon': Icons.cable},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Daftar Alat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return _buildGridItem(_items[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildGridItem(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item['icon'], size: 40, color: Colors.grey),
          const SizedBox(height: 8),
          Text(
            item['name'],
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
