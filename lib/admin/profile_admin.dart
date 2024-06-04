import 'package:flutter/material.dart';
import 'package:peminjaman_lab/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String _profileName = 'Admin';
  final String _profileNIM = '6701220000';
  final String _profileRole = 'Administrator';
  String _profileImageUrl = 'https://cdn0-production-images-kly.akamaized.net/FnprvDLlZmT8bOutattTcr6sCIY=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4179938/original/068642100_1664862182-ariel_tatum_pfw.jpg';

  void _changeProfilePicture() {
    setState(() {
      _profileImageUrl = 'https://via.placeholder.com/150';
    });
  }

  void _changePassword() {
    // Implement password change functionality
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
        title: const Text('Profile',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(_profileImageUrl),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _changeProfilePicture,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: const TextStyle(fontSize: 14),
                ),
                child: const Text('Ubah Foto Profil'),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileItem('Nama', _profileName),
                      const SizedBox(height: 15),
                      _buildProfileItem('NIM', _profileNIM),
                      const SizedBox(height: 15),
                      _buildProfileItem('Peran', _profileRole),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _changePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Ganti Kata Sandi'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _signOut(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Keluar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
