import 'package:flutter/material.dart';

class EditRuanganPage extends StatelessWidget {
  final Map<String, String> room;
  final String ruanganName;

  const EditRuanganPage({super.key, required this.room, required this.ruanganName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Ruangan'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField('Room Image', Icons.file_upload),
            const SizedBox(height: 20),
            _buildTextField(ruanganName, Icons.edit),
            const SizedBox(height: 20),
            _buildTextField(room['capacity'] ?? 'Capacity', Icons.edit),
            const SizedBox(height: 20),
            _buildRadioButtonGroup(),
            const SizedBox(height: 20),
            _buildStatusSwitch(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your delete functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Hapus'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your save functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget _buildRadioButtonGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Kondisi Ruangan'),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text('Baik'),
                leading: Radio(
                  value: 'Baik',
                  groupValue: 'Kondisi Ruangan',
                  onChanged: (value) {
                    // Handle radio button change
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('Cukup'),
                leading: Radio(
                  value: 'Cukup',
                  groupValue: 'Kondisi Ruangan',
                  onChanged: (value) {
                    // Handle radio button change
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Status'),
        Switch(
          value: false,
          onChanged: (value) {
            // Handle switch change
          },
        ),
        const Text('Tidak Tersedia / Tersedia'),
      ],
    );
  }
}
