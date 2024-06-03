import 'package:flutter/material.dart';

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
        backgroundColor: Colors.green,
        title: const Text('Daftar Alat', style: TextStyle(color: Colors.black)),
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
              child: Text('Daftar Alat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                              builder: (context) => DetailAlatPage(tool: tool, title: ''),
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
                                tool['image']!,
                                height: 80,
                                width: 80,
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

class DetailAlatPage extends StatelessWidget {
  final Map<String, String> tool;

  const DetailAlatPage({super.key, required this.tool, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Detail Alat', style: TextStyle(color: Colors.black)),
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
            Image.asset(tool['image']!),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nama Alat:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(tool['name']!),
                  const SizedBox(height: 10),
                  const Text('Keycaps:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('OEM Profile (82 Keycaps)'),
                  const SizedBox(height: 10),
                  const Text('Switch:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('Red Switch'),
                  const SizedBox(height: 10),
                  const Text('Connection:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('USB Type-C, Bluetooth'),
                  const SizedBox(height: 10),
                  const Text('Size:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('75% Layout'),
                  const SizedBox(height: 10),
                  const Text('Jumlah Yang Tersedia:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('24 Unit'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
