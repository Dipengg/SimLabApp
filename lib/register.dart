import 'package:flutter/material.dart';
import 'adminregister.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String roleValue = 'Pilih sebagai apa';
  String message = '';

void _registerAccount() {
  String email = _emailController.text.trim();
  String name = _nameController.text.trim();
  String nim = _nimController.text.trim();
  String password = _passwordController.text.trim();

  if (email.isEmpty || name.isEmpty || nim.isEmpty || password.isEmpty || roleValue == 'Pilih sebagai apa') {
    setState(() {
      message = "Silakan isi semua kolom.";
    });
  } else {
    setState(() {
      message = "Registrasi Berhasil";
    });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: roleValue,
                isExpanded: true,
                onChanged: (String? newValue) {
                  if (newValue == "Admin") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AdminRegisterPage()),
                    );
                  } else {
                    setState(() {
                      roleValue = newValue!;
                      if (newValue == "Peminjam") {
                        _registerAccount();
                      }
                    });
                  }
                },
                items: <String>['Pilih sebagai apa', 'Peminjam', 'Admin']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
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
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  hintText: 'Masukkan NIM anda',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Kata Sandi',
                  hintText: 'Masukkan kata sandi anda',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerAccount,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green,
                ),
                child: const Text('Daftar'),
              ),
              Visibility(
                visible: message.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Sudah memiliki akun? Masuk disini!', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
