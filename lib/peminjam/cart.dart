import 'package:flutter/material.dart';
import 'formpeminjaman.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> _items = [
    {'name': 'Keyboard', 'category': 'Alat', 'status': 'Cukup', 'quantity': 1, 'image': 'images/keyboard.jpg'},
    {'name': 'Proyektor', 'category': 'Alat', 'status': 'Baik', 'quantity': 1, 'image': 'images/proyektor.jpg'},
    {'name': 'Kabel HDMI', 'category': 'Alat', 'status': 'Cukup', 'quantity': 1, 'image': 'images/kabel_hdmi.jpg'},
    {'name': 'Laboratorium A1', 'category': 'Ruangan', 'status': 'Cukup', 'quantity': 1, 'image': 'images/lab_a1.jpg'},
  ];

  void _incrementQuantity(int index) {
    setState(() {
      _items[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_items[index]['quantity'] > 1) {
        _items[index]['quantity']--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    item['image'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('Kategori: ${item['category']}'),
                        Text('Status: ${item['status']}'),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle, color: Colors.green),
                        onPressed: () => _decrementQuantity(index),
                      ),
                      Text('${item['quantity']}', style: const TextStyle(fontSize: 16)),
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.green),
                        onPressed: () => _incrementQuantity(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeItem(index),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${_items.length} Item',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FormPeminjamanPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.green),
                  ),
                ),
                child: const Text(
                  'Peminjaman',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
