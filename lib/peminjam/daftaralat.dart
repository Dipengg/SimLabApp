import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/detailalat.dart';
import 'package:peminjaman_lab/peminjam/cart.dart';

class DaftarAlatPage extends StatefulWidget {
  const DaftarAlatPage({super.key});

  @override
  State<DaftarAlatPage> createState() => _DaftarAlatPageState();
}

class _DaftarAlatPageState extends State<DaftarAlatPage> {
  final List<Map<String, String>> tools = [
    {'name': 'Proyektor', 'image': 'images/proyektor.jpg'},
    {'name': 'Keyboard', 'image': 'images/keyboard.jpg'},
    {'name': 'Power Supply', 'image': 'images/power_supply.jpg'},
    {'name': 'RAM', 'image': 'images/RAM.jpg'},
    {'name': 'Kabel HDMI', 'image': 'images/kabel_hdmi.jpg'},
    {'name': 'Kabel Jack', 'image': 'images/kabel_jack.jpg'},
  ];

  List<Map<String, String>> _filteredTools = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredTools = tools;
    _searchController.addListener(_filterTools);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterTools);
    _searchController.dispose();
    super.dispose();
  }

  void _filterTools() {
    setState(() {
      _filteredTools = tools.where((tool) {
        return tool['name']!.toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Cari',
            prefixIcon: const Icon(Icons.search, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Alat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: _filteredTools.isEmpty
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
                    itemCount: _filteredTools.length,
                    itemBuilder: (context, index) {
                      final tool = _filteredTools[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailAlatPage(tool: tool),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      tool['image']!,
                                      height: 100,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  if (tool['name'] == 'Kabel HDMI' || tool['name'] == 'Kabel Jack')
                                    Container(
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Tidak Tersedia',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                tool['name']!,
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
