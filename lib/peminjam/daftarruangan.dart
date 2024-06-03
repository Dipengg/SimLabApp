import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/detailruangan.dart';

class DaftarRuanganPage extends StatefulWidget {
  const DaftarRuanganPage({super.key});

  @override
  State<DaftarRuanganPage> createState() => _DaftarRuanganPageState();
}

class _DaftarRuanganPageState extends State<DaftarRuanganPage> {
  final List<Map<String, String>> rooms = [
    {
      'name': 'Laboratorium A1',
      'image': 'images/lab_a1.jpg',
      'capacity': '35 Orang',
      'location': 'Lantai 2, Lorong Kanan, FIT',
      'operation': 'Windows 11'
    },
    {
      'name': 'Laboratorium A2',
      'image': 'images/lab_a2.jpg',
      'capacity': '30 Orang',
      'location': 'Lantai 2, Lorong Kanan, FIT',
      'operation': 'Windows 10'
    },
    {
      'name': 'Laboratorium A3',
      'image': 'images/lab_a3.jpg',
      'capacity': '25 Orang',
      'location': 'Lantai 2, Lorong Kiri, FIT',
      'operation': 'Linux'
    },
    {
      'name': 'Laboratorium A4',
      'image': 'images/lab_a4.jpg',
      'capacity': '40 Orang',
      'location': 'Lantai 3, Lorong Kanan, FIT',
      'operation': 'macOS'
    },
    {
      'name': 'Laboratorium A5',
      'image': 'images/lab_a5.jpg',
      'capacity': '20 Orang',
      'location': 'Lantai 3, Lorong Kiri, FIT',
      'operation': 'Windows 7'
    },
    {
      'name': 'Laboratorium A6',
      'image': 'images/lab_a6.jpg',
      'capacity': '50 Orang',
      'location': 'Lantai 4, Lorong Kanan, FIT',
      'operation': 'Windows 11'
    },
  ];

  List<Map<String, String>> _filteredRooms = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredRooms = rooms;
    _searchController.addListener(_filterRooms);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterRooms);
    _searchController.dispose();
    super.dispose();
  }

  void _filterRooms() {
    setState(() {
      _filteredRooms = rooms.where((room) {
        return room['name']!.toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Daftar Ruangan', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Daftar Ruangan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: _filteredRooms.isEmpty
                ? const Center(
                    child: Text(
                      'Tidak ditemukan hasil untuk pencarian ini',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: _filteredRooms.length,
                    itemBuilder: (context, index) {
                      final room = _filteredRooms[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailRuanganPage(room: room),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                room['image']!,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                room['name']!,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}