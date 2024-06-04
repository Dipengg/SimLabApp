import 'package:flutter/material.dart';
import 'package:peminjaman_lab/admin/edit_ruangan.dart';
import 'package:peminjaman_lab/admin/formulir_ruangan.dart';

class KelolaRuanganPage extends StatelessWidget {
  const KelolaRuanganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Ruangan'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildRoomGrid(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormulirRuanganPage()),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Cari',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildRoomGrid(BuildContext context) {
    final rooms = [
      {'title': 'Laboratorium A1', 'image': 'images/lab_a1.jpg'},
      {'title': 'Laboratorium A2', 'image': 'images/lab_a2.jpg'},
      {'title': 'Laboratorium A3', 'image': 'images/lab_a3.jpg'},
      {'title': 'Laboratorium A4', 'image': 'images/lab_a4.jpg'},
    ];

    return Expanded(
      child: GridView.builder(
        itemCount: rooms.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditRuanganPage(room: rooms[index], ruanganName: '',),
                ),
              );
            },
            child: _gridItem(rooms[index]),
          );
        },
      ),
    );
  }

  Widget _gridItem(Map<String, String> room) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            room['image']!,
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 10),
          Text(
            room['title']!,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}