import 'package:flutter/material.dart';

class FormPeminjamanPage extends StatefulWidget {
  const FormPeminjamanPage({super.key});

  @override
  State<FormPeminjamanPage> createState() => _FormPeminjamanPageState();
}

class _FormPeminjamanPageState extends State<FormPeminjamanPage> {
  DateTime? _tanggalPeminjaman;
  DateTime? _tanggalPengembalian;
  final TextEditingController _keperluanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Peminjaman', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailSection('Identitas Peminjam', 'Roila Rachipan\n6701220000'),
              _buildDetailSection('Kategori', '-'),
              _buildDetailSection('Detail Peminjaman', '•'),
              const SizedBox(height: 20),
              _buildDateField('Tanggal Peminjaman', _tanggalPeminjaman, (selectedDate) {
                setState(() {
                  _tanggalPeminjaman = selectedDate;
                });
              }),
              const SizedBox(height: 20),
              _buildDateField('Tanggal Pengembalian', _tanggalPengembalian, (selectedDate) {
                setState(() {
                  _tanggalPengembalian = selectedDate;
                });
              }),
              const SizedBox(height: 20),
              _buildTextField('Keperluan', 'Masukkan keterangan keperluan', _keperluanController),
              const SizedBox(height: 20),
              const Text(
                'Dimohon mengisi form peminjaman dengan sebenar-benarnya. Dan harap perhatikan data yang anda inputkan.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ValidationDialog(
                          onConfirm: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  title: 'Sukses!',
                                  content: 'Data peminjaman anda telah terkirim!',
                                  confirmText: 'Oke',
                                  onConfirm: () {
                                    Navigator.of(context).popUntil((route) => route.isFirst);
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Kirim', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? selectedDate, ValueChanged<DateTime?> onDateSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              onDateSelected(pickedDate);
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: selectedDate == null
                  ? 'Masukkan tanggal peminjaman'
                  : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              selectedDate == null
                  ? 'Masukkan tanggal peminjaman'
                  : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class ValidationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ValidationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          Icon(Icons.warning, color: Colors.yellow[700], size: 30),
          const SizedBox(width: 10),
          const Text(
            'Validasi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: const Text(
        'Apakah anda yakin dengan data yang anda masukkan?',
        style: TextStyle(fontSize: 16),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text('Tidak', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text('Yakin'),
        ),
      ],
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback onConfirm;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green[700], size: 30),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Text(
        content,
        style: const TextStyle(fontSize: 16),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: Text(confirmText),
        ),
      ],
    );
  }
}
