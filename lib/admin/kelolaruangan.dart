import 'package:flutter/material.dart';
import 'package:peminjaman_lab/admin/edit_ruangan.dart';
import 'package:peminjaman_lab/admin/formulir_ruangan.dart';

class KelolaRuanganPage extends StatefulWidget {
  const KelolaRuanganPage({super.key});

  @override
  _KelolaRuanganPageState createState() => _KelolaRuanganPageState();
}

class _KelolaRuanganPageState extends State<KelolaRuanganPage> {
  List<Map<String, dynamic>> roomItems = [
    {'title': 'Laboratorium A1', 'image': 'images/lab_a1.jpg'},
    {'title': 'Laboratorium A2', 'image': 'images/lab_a2.jpg'},
    {'title': 'Laboratorium A3', 'image': 'images/lab_a3.jpg'},
    {'title': 'Laboratorium A4', 'image': 'images/lab_a4.jpg'},
  ];

  void deleteRoom(Map<String, dynamic> deletedItem) {
    setState(() {
      roomItems.remove(deletedItem);
    });
  }

  void saveRoom(Map<String, dynamic> updatedItem) {
    setState(() {
      // Implement save functionality here
    });
  }

  void addRoom(Map<String, dynamic> newItem) {
    setState(() {
      roomItems.add(newItem);
    });
  }

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
            _buildGrid(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormulirRuanganPage(
                onSubmit: (Map<String, dynamic> newRoom) {
                  addRoom(newRoom);
                  Navigator.of(context).pop();
                },
              ),
            ),
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

  Widget _buildGrid() {
    return Expanded(
      child: GridView.builder(
        itemCount: roomItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return _gridItem(context, roomItems[index]);
        },
      ),
    );
  }

  Widget _gridItem(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditRuanganPage(
              room: item,
              ruanganName: item['title'],
              onDelete: deleteRoom,
              onSave: saveRoom,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
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
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                item['image'],
                height: 80,
                width: 80,
              ),
              const SizedBox(height: 10),
              Text(
                item['title'],
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
