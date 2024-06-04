import 'package:flutter/material.dart';
import 'package:peminjaman_lab/peminjam/cart.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, dynamic>> _items = [
    {'name': 'Proyektor', 'image': 'images/proyektor.jpg', 'type': 'Alat', 'status': 'Tersedia', 'kondisi': 'Baik'},
    {'name': 'Keyboard', 'image': 'images/keyboard.jpg', 'type': 'Alat', 'status': 'Tidak tersedia', 'kondisi': 'Cukup'},
    {'name': 'Power Supply', 'image': 'images/power_supply.jpg', 'type': 'Alat', 'status': 'Tersedia', 'kondisi': 'Baik'},
    {'name': 'RAM', 'image': 'images/RAM.jpg', 'type': 'Alat', 'status': 'Tersedia', 'kondisi': 'Baik'},
    {'name': 'Laboratorium A1', 'image': 'images/lab_a1.jpg', 'type': 'Ruangan', 'status': 'Tersedia', 'kondisi': 'Baik'},
    {'name': 'Laboratorium A2', 'image': 'images/lab_a2.jpg', 'type': 'Ruangan', 'status': 'Tidak tersedia', 'kondisi': 'Cukup'},
  ];

  List<Map<String, dynamic>> _filteredItems = [];
  String _searchQuery = '';
  String _filterType = 'Semua';
  String _filterStatus = 'Semua';
  String _filterKondisi = 'Semua';

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _filterItems() {
    setState(() {
      _filteredItems = _items.where((item) {
        final matchesSearchQuery = item['name'].toLowerCase().contains(_searchQuery.toLowerCase());
        final matchesType = _filterType == 'Semua' || item['type'] == _filterType;
        final matchesStatus = _filterStatus == 'Semua' || item['status'] == _filterStatus;
        final matchesKondisi = _filterKondisi == 'Semua' || item['kondisi'] == _filterKondisi;
        return matchesSearchQuery && matchesType && matchesStatus && matchesKondisi;
      }).toList();
    });
  }

  void _showFilterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterPage(
          filterType: _filterType,
          filterStatus: _filterStatus,
          filterKondisi: _filterKondisi,
          onApply: (newFilterType, newFilterStatus, newFilterKondisi) {
            setState(() {
              _filterType = newFilterType;
              _filterStatus = newFilterStatus;
              _filterKondisi = newFilterKondisi;
              _filterItems();
            });
          },
        ),
      ),
    );
  }

  void _showCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.search, color: Colors.black54),
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Cari',
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                      _filterItems();
                    });
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list, color: Colors.black54),
                onPressed: _showFilterPage,
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black54),
                onPressed: _showCartPage,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Rekomendasi Pencarian', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: _filteredItems.isEmpty
                ? const Center(
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
          Image.asset(item['image'], height: 80, width: 80),
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

class FilterPage extends StatefulWidget {
  final String filterType;
  final String filterStatus;
  final String filterKondisi;
  final Function(String, String, String) onApply;

  const FilterPage({
    super.key,
    required this.filterType,
    required this.filterStatus,
    required this.filterKondisi,
    required this.onApply,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late String _selectedFilterType;
  late String _selectedFilterStatus;
  late String _selectedFilterKondisi;

  @override
  void initState() {
    super.initState();
    _selectedFilterType = widget.filterType;
    _selectedFilterStatus = widget.filterStatus;
    _selectedFilterKondisi = widget.filterKondisi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ['Semua', 'Alat', 'Ruangan'].map((String value) {
                return ChoiceChip(
                  label: Text(value),
                  selected: _selectedFilterType == value,
                  onSelected: (selected) {
                    setState(() {
                      _selectedFilterType = value;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ['Semua', 'Tersedia', 'Tidak tersedia'].map((String value) {
                return ChoiceChip(
                  label: Text(value),
                  selected: _selectedFilterStatus == value,
                  onSelected: (selected) {
                    setState(() {
                      _selectedFilterStatus = value;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Kondisi', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ['Semua', 'Cukup', 'Baik'].map((String value) {
                return ChoiceChip(
                  label: Text(value),
                  selected: _selectedFilterKondisi == value,
                  onSelected: (selected) {
                    setState(() {
                      _selectedFilterKondisi = value;
                    });
                  },
                );
              }).toList(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onApply(_selectedFilterType, _selectedFilterStatus, _selectedFilterKondisi);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Terapkan'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
