import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/database_service.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final DatabaseService _dbService = DatabaseService();

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  void _fetchProfile() async {
    // Implementasi pengambilan data profil dari database
    _nameController.text = widget.user.name;
    _emailController.text = widget.user.email;
  }

  void _saveProfile() async {
    final String name = _nameController.text;
    final String email = _emailController.text;

    // Periksa apakah ada perubahan pada data profil
    bool isProfileChanged =
        name != widget.user.name || email != widget.user.email;

    // Implementasi penyimpanan data profil ke database
    final updatedUser = User(
        id: widget.user.id,
        name: name,
        email: email,
        password: widget.user.password);
    await _dbService.updateUser(updatedUser);

    // Tampilkan pesan sukses
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully!')),
    );

    // Jika profil berubah, navigasi ke halaman login
    if (isProfileChanged) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
