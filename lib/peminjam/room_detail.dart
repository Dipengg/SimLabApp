import 'package:flutter/material.dart';

class RoomDetailPage extends StatelessWidget {
  final Map<String, String> room;

  const RoomDetailPage({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Detail Ruangan', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(room['image']!),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Ruangan:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room['name']!),
                  SizedBox(height: 10),
                  Text('Kapasitas:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room['capacity']!),
                  SizedBox(height: 10),
                  Text('Lokasi:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room['location']!),
                  SizedBox(height: 10),
                  Text('Operation:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room['operation']!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
