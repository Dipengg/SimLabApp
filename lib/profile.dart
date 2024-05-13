import 'package:flutter/material.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String _profileName = 'Rayyan Ali Bieber';
  final String _profileNIM = '6701223058';
  final String _profileRole = 'Mahasiswa';
  String _profileImageUrl = 'https://via.placeholder.com/150';
  void _changeProfilePicture() {
    setState(() {

      _profileImageUrl = 'https://via.placeholder.com/150'; 
    });
  }

  void _changePassword() {

  }

  void _signOut(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(_profileImageUrl),
                ),
                Positioned(
                  bottom: 0,
                  child: ElevatedButton(
                    onPressed: _changeProfilePicture,
                    child: const Text('Ubah Foto Profil'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Nama:',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _profileName,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'NIM:',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _profileNIM,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Role:',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _profileRole,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePassword,
              child: const Text('Ganti Kata Sandi'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _signOut(context),
              child: const Text('Keluar Akun'),
            ),
          ],
        ),
      ),
    );
  }
}
