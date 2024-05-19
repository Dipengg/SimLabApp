import 'package:flutter/material.dart';
import 'tool_detail.dart';

class ToolListPage extends StatefulWidget {
  const ToolListPage({super.key});

  @override
  State<ToolListPage> createState() => _ToolListPageState();
}

class _ToolListPageState extends State<ToolListPage> {
  final List<Map<String, String>> tools = [
    {'name': 'Proyektor', 'image': 'images/proyektor.jpg'},
    {'name': 'Keyboard', 'image': 'images/keyboard.jpg'},
    {'name': 'Power Supply', 'image': 'images/power_supply.jpg'},
    {'name': 'RAM', 'image': 'images/RAM.jpg'},
    {'name': 'Kabel HDMI', 'image': 'images/kabel_hdmi.jpg'},
    {'name': 'Kabel Jack', 'image': 'images/kabel_jack.jpg'},
  ];

  List<Map<String, String>> _filteredTools = [];
  TextEditingController _searchController = TextEditingController();

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
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Daftar Alat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: _filteredTools.isEmpty
                ? Center(
                    child: Text(
                      'Tidak ditemukan hasil untuk pencarian ini',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                              builder: (context) => ToolDetailPage(tool: tool),
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
                              SizedBox(height: 10),
                              Text(
                                tool['name']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
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
