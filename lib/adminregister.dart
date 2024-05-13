import 'package:flutter/material.dart';
import 'login.dart';

class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({super.key});

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String message = '';

void _registerAdmin() {
  String email = _emailController.text.trim();
  String name = _nameController.text.trim();
  String nip = _nipController.text.trim();
  String password = _passwordController.text.trim();

  if (email.isEmpty || name.isEmpty || nip.isEmpty || password.isEmpty) {
    setState(() {
      message = "Silakan isi semua kolom.";
    });
  } else {
    setState(() {
      message = "Registrasi Berhasil";
    });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran Admin'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Masukkan email anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                hintText: 'Masukkan nama anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nipController,
              decoration: const InputDecoration(
                labelText: 'NIP',
                hintText: 'Masukkan NIP anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Kata Sandi',
                hintText: 'Masukkan kata sandi baru anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerAdmin,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green,
              ),
              child: const Text('Daftar'),
            ),
            Visibility(
              visible: message.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Sudah memiliki akun? Masuk disini!',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
