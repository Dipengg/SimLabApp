import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, dynamic>> _items = [
    {'name': 'Proyektor', 'icon': Icons.desktop_windows, 'type': 'Alat'},
    {'name': 'Keyboard', 'icon': Icons.keyboard, 'type': 'Alat'},
    {'name': 'Power Supply', 'icon': Icons.power, 'type': 'Alat'},
    {'name': 'RAM', 'icon': Icons.memory, 'type': 'Alat'},
    {'name': 'Kabel HDMI', 'icon': Icons.cable, 'type': 'Alat'},
    {'name': 'Kabel Jack', 'icon': Icons.cable, 'type': 'Alat'},
    {'name': 'Laboratorium A1', 'icon': Icons.meeting_room, 'type': 'Ruangan'},
    {'name': 'Laboratorium A2', 'icon': Icons.meeting_room, 'type': 'Ruangan'},
  ];

  List<Map<String, dynamic>> _filteredItems = [];
  String _searchQuery = '';
  String _filterType = 'Semua';

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _filterItems() {
    setState(() {
      if (_filterType == 'Semua') {
        _filteredItems = _items.where((item) {
          return item['name'].toLowerCase().contains(_searchQuery.toLowerCase());
        }).toList();
      } else {
        _filteredItems = _items.where((item) {
          return item['name'].toLowerCase().contains(_searchQuery.toLowerCase()) &&
              item['type'] == _filterType;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Pencarian'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
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
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                      _filterItems();
                    });
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _filterType,
                  items: ['Semua', 'Alat', 'Ruangan'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _filterType = newValue!;
                      _filterItems();
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _filteredItems.isEmpty
                ? Center(
                    child: Text(
                      'Tidak ditemukan hasil untuk pencarian ini',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.all(10),
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      return _buildGridItem(_filteredItems[index]);
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
