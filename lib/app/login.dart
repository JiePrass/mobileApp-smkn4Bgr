import 'package:flutter/material.dart';
import 'welcome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == '' && password == '') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Username or password is incorrect.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Background abu-abu muda
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0), // Jarak dalam kotak
              width: 300, // Lebar container diperkecil
              decoration: BoxDecoration(
                color: Colors.white, // Warna kotak
                borderRadius:
                    BorderRadius.circular(12.0), // Sudut sedikit membulat
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.3), // Warna bayangan lebih ringan
                    spreadRadius: 3, // Luas penyebaran bayangan lebih kecil
                    blurRadius: 10, // Jarak blur lebih kecil
                    offset: const Offset(0, 3), // Posisi bayangan
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Teks Welcome Back
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24, // Ukuran teks lebih kecil
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please login to start your session',
                    style: TextStyle(
                      fontSize: 14, // Ukuran teks lebih kecil
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Gambar ilustrasi di bawah teks welcome
                  Image.asset(
                    'assets/img/login.png', // Pastikan mengganti dengan lokasi gambar yang tepat
                    height: 150, // Ukuran gambar diperkecil
                  ),
                  const SizedBox(height: 16),

                  // Input Username
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.grey[600]),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Input Password
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
                      suffixIcon:
                          Icon(Icons.visibility_off, color: Colors.grey[600]),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),

                  // Tautan Forgot Password dan Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Tambahkan aksi untuk forgot password
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  Colors.blueAccent), // Ukuran teks lebih kecil
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Tambahkan aksi untuk register
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  Colors.blueAccent), // Ukuran teks lebih kecil
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Tombol Login
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0), // Padding lebih kecil
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: _login,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white), // Ukuran teks lebih kecil
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
